import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/main.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/app_icon.dart';
import 'package:grocery_app_front/widgets/big_text.dart';
import 'package:grocery_app_front/widgets/expendable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        size: Dimensions.fontSize26,
                        text: "Chinese meatballs")),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.popularFoodDetailImageSize,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/image/food0.jpg",
                    width: double.maxFinite, fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpendableTextWidget(
                    text:
                        "An easy recipe for delicious, well-seasoned Asian meatballs with a marvelous sauce – sticky, with just a hint of sweetness, and very flavorful. I make them with ground beef, but the same recipe works beautifully with ground pork as well. These meatballs are the best! They combine the fun of eating meatballs with the extra fun of a sweet, sticky sauce. My kids adore them and love helping me make them.\nBut just as importantly, the grownups love them too! The meatballs themselves are very well seasoned - their flavor is quite complex and the Asian-style glaze greatly enhances them.Here's an overview of the ingredients you'll need to make these Asian meatballs. The exact measurements are listed in the recipe card below.Ground beef: I like to use lean ground beef in this recipe (85/15). I find that leaner than that tends to be too dry.Cilantro: If you dislike cilantro, you can use parsley instead. Though it really does add a unique flavor to the meat. However, if you're out of fresh herbs, you can simply use dried spices. An easy recipe for delicious, well-seasoned Asian meatballs with a marvelous sauce – sticky, with just a hint of sweetness, and very flavorful. I make them with ground beef, but the same recipe works beautifully with ground pork as well. These meatballs are the best! They combine the fun of eating meatballs with the extra fun of a sweet, sticky sauce. My kids adore them and love helping me make them.\nBut just as importantly, the grownups love them too! The meatballs themselves are very well seasoned - their flavor is quite complex and the Asian-style glaze greatly enhances them.Here's an overview of the ingredients you'll need to make these Asian meatballs. The exact measurements are listed in the recipe card below.Ground beef: I like to use lean ground beef in this recipe (85/15). I find that leaner than that tends to be too dry.Cilantro: If you dislike cilantro, you can use parsley instead. Though it really does add a unique flavor to the meat. However, if you're out of fresh herbs, you can simply use dried spices. An easy recipe for delicious, well-seasoned Asian meatballs with a marvelous sauce – sticky, with just a hint of sweetness, and very flavorful. I make them with ground beef, but the same recipe works beautifully with ground pork as well. These meatballs are the best! They combine the fun of eating meatballs with the extra fun of a sweet, sticky sauce. My kids adore them and love helping me make them.\nBut just as importantly, the grownups love them too! The meatballs themselves are very well seasoned - their flavor is quite complex and the Asian-style glaze greatly enhances them.Here's an overview of the ingredients you'll need to make these Asian meatballs. The exact measurements are listed in the recipe card below.Ground beef: I like to use lean ground beef in this recipe (85/15). I find that leaner than that tends to be too dry.Cilantro: If you dislike cilantro, you can use parsley instead. Though it really does add a unique flavor to the meat. However, if you're out of fresh herbs, you can simply use dried spices."),
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
                  text: "€ 9.5 X 0",
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
                    text: "\$9.5 | Add to cart",
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
