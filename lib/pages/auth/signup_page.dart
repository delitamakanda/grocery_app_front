import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app_front/base/custom_snackbar.dart';
import 'package:grocery_app_front/controllers/auth_controller.dart';
import 'package:grocery_app_front/models/signup_body_model.dart';
import 'package:grocery_app_front/utils/colors.dart';
import 'package:grocery_app_front/utils/dimensions.dart';
import 'package:grocery_app_front/widgets/app_text_field_widget.dart';
import 'package:grocery_app_front/widgets/big_text.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signupImages = [
      "t.png",
      "g.png",
    ];
    void _registration() {
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      if (name.isEmpty) {
        //
      } else if (email.isEmpty) {
        showCustomSnackbar("Email is required", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar("Not a valid email address",
            title: "Valid email address");
      } else if (phone.isEmpty) {
        showCustomSnackbar("Phone is required", title: "Phone");
      } else if (name.isEmpty) {
        showCustomSnackbar("Name is required", title: "Name");
      } else if (password.isEmpty) {
        showCustomSnackbar("Password is required", title: "Password");
      } else if (password.length < 8) {
        showCustomSnackbar("Password must be longer than 8 characters",
            title: "Password validation");
      } else {
        showCustomSnackbar("Done", title: "Perfect");
        SignupBody signupBody = SignupBody(
            email: email, password: password, phone: phone, name: name);
        authController.registration(signupBody).then((status) {
          if (status.isSuccess) {
            print("success registration: " + status.message);
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
          AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email),
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(
              textController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp),
          SizedBox(
            height: Dimensions.height20,
          ),
          AppTextField(
              textController: nameController,
              hintText: "Name",
              icon: Icons.person),
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
          GestureDetector(
            onTap: () {
              _registration();
            },
            child: Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  color: Colors.white,
                  text: "Signup",
                  size: Dimensions.fontSize20 + Dimensions.fontSize20 / 2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.fontSize20),
                  text: "Have an account ?",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.back())),
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          RichText(
              text: TextSpan(
            style: TextStyle(
                color: Colors.grey[500], fontSize: Dimensions.fontSize16),
            text: "Signup using one of the following options",
          )),
          Wrap(
            children: List.generate(
                2,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: Dimensions.radius30,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage("assets/image/${signupImages[index]}"),
                      ),
                    )),
          )
        ]),
      ),
    );
  }
}
