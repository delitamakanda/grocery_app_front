import 'package:get/get.dart';
import 'package:grocery_app_front/controllers/popular_product_controller.dart';
import 'package:grocery_app_front/data/api/api_client.dart';
import 'package:grocery_app_front/data/repository/popular_product_repo.dart';

Future<void> init() async {
  // api clients
  Get.lazyPut(() => ApiClient(appBaseUrl: 'http://localhost:8080/api/v1/'));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
