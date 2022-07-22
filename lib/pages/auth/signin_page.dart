import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/base/custom_loader.dart';
import 'package:grocery_app_front/base/custom_snackbar.dart';
import 'package:grocery_app_front/controllers/auth_controller.dart';
import 'package:grocery_app_front/pages/auth/signup_page.dart';
import 'package:grocery_app_front/routes/route_helper.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/app_text_field_widget.dart';
import 'package:grocery_app_front/widgets/big_text.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      if (phone.isEmpty) {
        showCustomSnackbar("Phone is required", title: "Phone");
      } else if (password.isEmpty) {
        showCustomSnackbar("Password is required", title: "Password");
      } else if (password.length < 8) {
        showCustomSnackbar("Password must be longer than 8 characters",
            title: "Password validation");
      } else {
        showCustomSnackbar("Done", title: "Perfect");
        authController.login(phone, password).then((status) {
          print('status' + status.toString());
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: Dimensions.screenHeight * 0.05,
                  ),
                  Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: Center(
                        child: const CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/image/logo1.png"),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      width: double.maxFinite,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello",
                                style: TextStyle(
                                    fontSize: Dimensions.fontSize20 * 3 +
                                        Dimensions.fontSize20 / 2,
                                    fontWeight: FontWeight.bold)),
                            Text("Sign into your account",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.fontSize20,
                                    fontWeight: FontWeight.bold))
                          ])),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AppTextField(
                      textController: phoneController,
                      hintText: "Phone",
                      icon: Icons.phone),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  AppTextField(
                    textController: passwordController,
                    hintText: "Password",
                    icon: Icons.password_sharp,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      RichText(
                          text: TextSpan(
                              text: "Lost password ?",
                              style: TextStyle(
                                  fontSize: Dimensions.fontSize20,
                                  color: Colors.grey[500]))),
                      SizedBox(
                        width: Dimensions.width20,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _login(_authController);
                    },
                    child: Container(
                      width: Dimensions.screenWidth / 2,
                      height: Dimensions.screenHeight / 13,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: AppColors.mainColor),
                      child: Center(
                        child: BigText(
                          color: Colors.white,
                          text: "Sign in",
                          size:
                              Dimensions.fontSize20 + Dimensions.fontSize20 / 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.05,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.fontSize20),
                          text: "Don\'t have an account? ",
                          children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Get.toNamed(RouteHelper.getSignup()),
                          text: "Create a new account",
                          style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.fontSize20,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                ]),
              )
            : const CustomLoader();
      }),
    );
  }
}
