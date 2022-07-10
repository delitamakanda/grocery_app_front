import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/controllers/recommended_product_controller.dart';
import 'package:grocery_app_front/main.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
import 'package:grocery_app_front/utils/app_constants.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/app_icon.dart';
import 'package:grocery_app_front/widgets/big_text.dart';
import 'package:grocery_app_front/widgets/expendable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                    ),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
                child: Center(
                    child: BigText(
                        size: Dimensions.fontSize26, text: product.name!)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.popularFoodDetailImageSize,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    "${AppConstants.BASE_URL.trim()}${AppConstants.UPLOAD_URL}${product.img!}",
                    width: double.maxFinite,
                    fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpendableTextWidget(text: product.description!),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height20,
                bottom: Dimensions.fontSize20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "${product.price!} € X 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.fontSize26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(Icons.favorite, color: AppColors.mainColor),
                ),
                Container(
                  child: BigText(
                    text: "${product.price!} \€ | Add to cart",
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          )
        ],
      ),
      /*bottomNavigationBar: Container(
        
      ),*/
    );
  }
}
