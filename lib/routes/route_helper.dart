import 'package:get/get.dart';
import 'package:grocery_app_front/pages/address/add_address_page.dart';
import 'package:grocery_app_front/pages/auth/signin_page.dart';
import 'package:grocery_app_front/pages/auth/signup_page.dart';
import 'package:grocery_app_front/pages/cart/cart_history.dart';
import 'package:grocery_app_front/pages/cart/cart_page.dart';
import 'package:grocery_app_front/pages/food/popular_food_detail.dart';
import 'package:grocery_app_front/pages/food/recommended_food_detail.dart';
import 'package:grocery_app_front/pages/home/home_page.dart';
import 'package:grocery_app_front/pages/splash/splash_page.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String initial = '/';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cart = '/cart';
  static const String cartHistory = '/cart-history';
  static const String addAddress = '/add-address';

  static String getSplash() => splash;
  static String getInitial() => initial;
  static String getSignin() => signin;
  static String getSignup() => signup;
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCart() => cart;
  static String getCartHistory() => cartHistory;
  static String getAddress() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () {
          return SplashPage();
        }),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        }),
    GetPage(
        name: signup,
        page: () {
          return SignupPage();
        },
        transition: Transition.fade),
    GetPage(
        name: signin,
        page: () {
          return SigninPage();
        }),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cart,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartHistory,
        page: () {
          return CartHistoryPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: addAddress,
        page: () {
          return AddAddressPage();
        },
        transition: Transition.fadeIn)
  ];
}
