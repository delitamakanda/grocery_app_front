import 'package:get/get.dart';
import 'package:grocery_app_front/controllers/auth_controller.dart';
import 'package:grocery_app_front/controllers/cart_controller.dart';
import 'package:grocery_app_front/controllers/location_controller.dart';
import 'package:grocery_app_front/controllers/popular_product_controller.dart';
import 'package:grocery_app_front/controllers/recommended_product_controller.dart';
import 'package:grocery_app_front/controllers/user_controller.dart';
import 'package:grocery_app_front/data/api/api_client.dart';
import 'package:grocery_app_front/data/repository/auth_repo.dart';
import 'package:grocery_app_front/data/repository/cart_repo.dart';
import 'package:grocery_app_front/data/repository/location_repo.dart';
import 'package:grocery_app_front/data/repository/popular_product_repo.dart';
import 'package:grocery_app_front/data/repository/recommended_product_repo.dart';
import 'package:grocery_app_front/data/repository/user_repo.dart';
import 'package:grocery_app_front/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // api clients
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendProductRepo: Get.find()));
  Get.lazyPut(
    () => CartController(cartRepo: Get.find()),
  );
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
