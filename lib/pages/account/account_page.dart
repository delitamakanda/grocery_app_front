import 'package:flutter/material.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/account_widget.dart';
import 'package:grocery_app_front/widgets/app_icon.dart';
import 'package:grocery_app_front/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: Dimensions.fontSize20,
            color: Colors.white,
          )),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(children: [
          AppIcon(
            icon: Icons.person,
            iconSize: Dimensions.height45 + Dimensions.height30,
            size: Dimensions.height15 * 10,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "Délita",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "06XXXXXXXX",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "email@company.com",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "46 quai de la marne ",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "Message",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "Message",
                      )),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
