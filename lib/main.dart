import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/controllers/popular_product_controller.dart';
import 'package:grocery_app_front/controllers/recommended_product_controller.dart';
import 'package:grocery_app_front/pages/home/main_food_page.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
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
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery app front',
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
