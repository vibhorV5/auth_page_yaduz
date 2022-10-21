import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';
import 'package:yaduz_login_join_us/Utility/utility.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/email_text_field.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/custom_button.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/password_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final utility = Utility();
    return Form(
      key: Get.find<AuthController>().loginFormKey,
      child: Column(
        children: [
          EmailTextFeild(
            emailController: Get.find<AuthController>().emailIdController,
            onSaved: (value) {
              Get.find<AuthController>().emailId = value!.trim();
            },
            validator: (value) {
              return Get.find<AuthController>().validateEmail(value!.trim());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordTextField(
            passwordController: Get.find<AuthController>().passwordController,
            onSaved: (value) {
              Get.find<AuthController>().password = value!;
            },
            validator: (value) {
              return Get.find<AuthController>().validatePassword(value!);
            },
          ),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              onTap: () async {
                if (Get.find<AuthController>()
                    .loginFormKey
                    .currentState!
                    .validate()) {
                  utility.showLoading(context);

                  Get.find<AuthController>().loginUser();
                }
              },
              buttonName: 'Login',
            ),
          ),
        ],
      ),
    );
  }
}
