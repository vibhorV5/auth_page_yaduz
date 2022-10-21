import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';
import 'package:yaduz_login_join_us/Utility/utility.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/custom_button.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/email_text_field.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/mobile_number_text_field.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/name_text_field.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/password_text_field.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<AuthController>().joinUsFormKey,
      child: Column(
        children: [
          const NameTextField(),
          const SizedBox(
            height: 20,
          ),
          const MobileNumberTextField(),
          const SizedBox(
            height: 20,
          ),
          EmailTextFeild(
            validator: (value) {
              return Get.find<AuthController>().validateEmail(value!.trim());
            },
            onSaved: (value) {
              Get.find<AuthController>().registerEmailId = value!.trim();
            },
            emailController:
                Get.find<AuthController>().registerEmailIdController,
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordTextField(
            passwordController:
                Get.find<AuthController>().registerPasswordController,
            onSaved: (value) {
              Get.find<AuthController>().registerPassword = value!;
            },
            validator: (value) {
              return Get.find<AuthController>().validatePassword(value!);
            },
          ),
          const SizedBox(
            height: 20,
          ),

          //Flutter Switch
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 16.0,
                    width: 30.0,
                    child: Obx(
                      () => FlutterSwitch(
                        width: 30.0,
                        height: 20.0,
                        valueFontSize: 12.0,
                        toggleSize: 10.0,
                        value: Get.find<AuthController>().check.value,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.black,
                        toggleColor: Colors.white,
                        onToggle: (val) {
                          Get.find<AuthController>().check.value = val;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: Get.width * 0.80,
                    // height: 40,
                    // color: pinkColor,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'Quicksand Regular',
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                              text: 'Terms and Conditions ',
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'Quicksand Medium',
                                color: Colors.black,
                              ),
                              recognizer: TapGestureRecognizer()
                              // ..onTap = () async =>
                              //     Get.to(const TermsAndConditionScreen()),
                              ),
                          const TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'Quicksand Regular',
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                              text: 'Privacy Policy.',
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'Quicksand Medium',
                                color: Colors.black,
                              ),
                              recognizer: TapGestureRecognizer()
                              // ..onTap = () async =>
                              //     Get.to(PrivacyPolicyScreen()),
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Get.find<AuthController>().check.value
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: customTextLeft(
                            Get.find<AuthController>().message.value,
                            13.0,
                            'Quicksand Medium',
                            Colors.red),
                      ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              onTap: () async {
                if (!Get.find<AuthController>().check.value) {
                  Get.find<AuthController>().message.value =
                      'Please agree to our terms & condition and privacy policy';
                } else {
                  showLoading(context);
                  Get.find<AuthController>().registerUser();
                }
              },
              buttonName: 'Join Us',
            ),
          ),
        ],
      ),
    );
  }
}
