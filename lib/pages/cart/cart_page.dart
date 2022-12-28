import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/base/no_data_page.dart';
import 'package:grocery_app_front/controllers/auth_controller.dart';
import 'package:grocery_app_front/controllers/cart_controller.dart';
import 'package:grocery_app_front/controllers/location_controller.dart';
import 'package:grocery_app_front/controllers/popular_product_controller.dart';
import 'package:grocery_app_front/controllers/recommended_product_controller.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
import 'package:grocery_app_front/utils/app_constants.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/app_icon.dart';
import 'package:grocery_app_front/widgets/big_text.dart';
import 'package:grocery_app_front/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24),
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24),
                ),
                AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.isNotEmpty
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      // color: Colors.red,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: 100,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  child: Row(children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);

                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularIndex, "cart"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          // Get.toNamed(RouteHelper.getRecommendedFood(
                                          // recommendedIndex, "cart"));
                                          if (recommendedIndex < 0) {
                                            Get.snackbar("History product",
                                                "Product review is not available for history products.",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                colorText: Colors.white);
                                          } else {
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex, "cart"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.width20 * 5,
                                        height: Dimensions.height20 * 5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${cartController.getItems[index].img!}")),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: Dimensions.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                              text: cartController
                                                  .getItems[index].name!,
                                              color: Colors.black54),
                                          SmallText(text: "Spicy"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                  text:
                                                      "${cartController.getItems[index].price!} €",
                                                  color: Colors.redAccent),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width10,
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    right: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                    color: Colors.white),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2,
                                                    ),
                                                    BigText(
                                                        text: _cartList[index]
                                                            .quantity!
                                                            .toString()),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: AppColors
                                                                .signColor))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ]),
                                );
                              });
                        }),
                      ),
                    ),
                  )
                : const NoDataPage(text: "Your cart is empty");
          })
        ]),
        bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: controller.getItems.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Dimensions.width10 / 2,
                            ),
                            BigText(
                                text: "${controller.totalAmount.toString()} €"),
                            SizedBox(
                              width: Dimensions.width10 / 2,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (Get.find<AuthController>().userHasLoggedIn()) {
                            // controller.addToHistory();
                            if (Get.find<LocationController>()
                                .addressList
                                .isEmpty) {
                              Get.toNamed(RouteHelper.getAddress());
                            }
                          } else {
                            Get.toNamed(RouteHelper.getSignin());
                          }
                        },
                        child: Container(
                          child: BigText(
                            text: "Checkout",
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(
                              left: Dimensions.width20,
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor),
                        ),
                      )
                    ],
                  )
                : Container(),
          );
        }));
  }
}
