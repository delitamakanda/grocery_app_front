import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/data/repository/cart_repo.dart';
import 'package:grocery_app_front/models/cart_model.dart';
import 'package:grocery_app_front/models/products_model.dart';
import 'package:grocery_app_front/utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: false,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar("Item count", "You should add an item to the cart",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    _items.forEach((key, value) {
      if (key == product.id) {
        quantity = value.quantity!;
      }
    });
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}