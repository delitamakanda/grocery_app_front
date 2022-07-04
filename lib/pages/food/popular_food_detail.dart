import 'package:flutter/material.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/app_column.dart';
import 'package:grocery_app_front/widgets/app_icon.dart';
import 'package:grocery_app_front/widgets/big_text.dart';
import 'package:grocery_app_front/widgets/expendable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodDetailImageSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food0.jpg"))),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  )
                ],
              )),
          Positioned(
              right: 0,
              top: Dimensions.popularFoodDetailImageSize - 20,
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "Chinese meat balls"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpendableTextWidget(
                            text:
                                "An easy recipe for delicious, well-seasoned Asian meatballs with a marvelous sauce – sticky, with just a hint of sweetness, and very flavorful. I make them with ground beef, but the same recipe works beautifully with ground pork as well. These meatballs are the best! They combine the fun of eating meatballs with the extra fun of a sweet, sticky sauce. My kids adore them and love helping me make them.\nBut just as importantly, the grownups love them too! The meatballs themselves are very well seasoned - their flavor is quite complex and the Asian-style glaze greatly enhances them.Here's an overview of the ingredients you'll need to make these Asian meatballs. The exact measurements are listed in the recipe card below.Ground beef: I like to use lean ground beef in this recipe (85/15). I find that leaner than that tends to be too dry.Cilantro: If you dislike cilantro, you can use parsley instead. Though it really does add a unique flavor to the meat. However, if you're out of fresh herbs, you can simply use dried spices.",
                          ),
                        ),
                      )
                    ]),
              )),
        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(Icons.add, color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              child: BigText(
                text: "\$10 | Add to cart",
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
      ),
    );
  }
}
