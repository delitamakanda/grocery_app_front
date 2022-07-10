import 'package:get/get.dart';
import 'package:grocery_app_front/data/repository/recommended_product_repo.dart';
import 'package:grocery_app_front/models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendProductRepo recommendProductRepo;
  RecommendedProductController({required this.recommendProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
