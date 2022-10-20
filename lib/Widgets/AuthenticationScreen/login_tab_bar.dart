import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/email_text_field.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/login_button.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/password_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<AuthController>().loginFormKey,
      child: Column(
        children: const [
          EmailTextFeild(),
          SizedBox(
            height: 20,
          ),
          PasswordTextField(),
          Align(
            alignment: Alignment.center,
            child: LoginButton(),
          ),
        ],
      ),
    );
  }
}
