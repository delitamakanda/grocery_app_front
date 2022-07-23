import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/base/custom_loader.dart';
import 'package:grocery_app_front/controllers/auth_controller.dart';
import 'package:grocery_app_front/controllers/cart_controller.dart';
import 'package:grocery_app_front/controllers/user_controller.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/account_widget.dart';
import 'package:grocery_app_front/widgets/app_icon.dart';
import 'package:grocery_app_front/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLogged = Get.find<AuthController>().userHasLoggedIn();
    if (_userLogged) {
      Get.find<UserController>().getUserData();
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: Dimensions.fontSize20,
            color: Colors.white,
          )),
      body: GetBuilder<UserController>(builder: (_userController) {
        return _userLogged
            ? (_userController.isLoading
                ? Container(
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
                                    text: _userController.userModel.firstName,
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
                                    text: _userController.userModel.phone,
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
                                    text: _userController.userModel.email,
                                  )),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.location_on,
                                    iconSize: Dimensions.height10 * 5 / 2,
                                    size: Dimensions.height10 * 5,
                                    backgroundColor: AppColors.yellowColor,
                                    iconColor: Colors.white,
                                  ),
                                  bigText: BigText(
                                    text: _userController.userModel.address
                                        .toString(),
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
                                    text: "Messages",
                                  )),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>()
                                      .userHasLoggedIn()) {
                                    Get.find<AuthController>()
                                        .clearSharedData();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.find<CartController>().clear();
                                    Get.offNamed(RouteHelper.getSignin());
                                  }
                                },
                                child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                    ),
                                    bigText: BigText(
                                      text: "Logout",
                                    )),
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                : CustomLoader())
            : Container(
                child: Center(
                    child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 8,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/image/empty_cart.png")))),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignin());
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 5,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child: Center(
                          child: BigText(
                        text: "Sign in",
                        color: Colors.white,
                        size: Dimensions.fontSize20,
                      )),
                    ),
                  ),
                ],
              )));
      }),
    );
  }
}
