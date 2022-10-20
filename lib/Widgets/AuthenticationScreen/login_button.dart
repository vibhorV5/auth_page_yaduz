import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';
import 'package:yaduz_login_join_us/Utility/utility.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
      child: InkWell(
        onTap: () async {
          if (Get.find<AuthController>()
              .loginFormKey
              .currentState!
              .validate()) {
            showLoading(context);

            Get.find<AuthController>().loginUser();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            left: 150,
            right: 150,
          ),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
