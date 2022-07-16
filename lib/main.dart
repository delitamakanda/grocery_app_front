import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/controllers/cart_controller.dart';
import 'package:grocery_app_front/controllers/popular_product_controller.dart';
import 'package:grocery_app_front/controllers/recommended_product_controller.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
import 'package:grocery_app_front/utils/app_constants.dart';
import 'helpers/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.APP_NAME,
              initialRoute: RouteHelper.getSplash(),
              getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}
