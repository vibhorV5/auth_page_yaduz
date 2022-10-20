import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';
import 'package:yaduz_login_join_us/Utility/utility.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/email_text_field.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/login_tab_bar.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/password_text_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  //  Widget firstNameField() {
  //   return
  // }

  // Widget mobileNo(context) {
  //   return
  // }

  // Widget joinUs() {
  //   return Form(
  //     // autovalidateMode: AutovalidateMode.onUserInteraction,
  //     key: authController.joinUsFormKey,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         firstNameField(),
  //         paddingAll(
  //           20.0,
  //           0.0,
  //           0.0,
  //           0.0,
  //           mobileNo(context),
  //         ),
  //         paddingAll(
  //           20.0,
  //           0.0,
  //           0.0,
  //           0.0,
  //           emailField(authController.registerEmailIdController),
  //         ),
  //         paddingAll(
  //           20.0,
  //           0.0,
  //           0.0,
  //           0.0,
  //           passwordField(authController.registerPasswordController),
  //         ),
  //         paddingAll(
  //             30.0,
  //             0.0,
  //             0.0,
  //             0.0,
  //             Container(
  //               width: getWidth(context),
  //               // height: 50.0,
  //               // color: Colors.yellow,
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       paddingAll(
  //                         0.0,
  //                         0.0,
  //                         0.0,
  //                         0.0,
  //                         SizedBox(
  //                             height: 16.0,
  //                             width: 30.0,
  //                             child: Obx(() => FlutterSwitch(
  //                                   width: 30.0,
  //                                   height: 20.0,
  //                                   valueFontSize: 12.0,
  //                                   toggleSize: 10.0,
  //                                   value: authController.check.value,
  //                                   inactiveColor: grayColor,
  //                                   activeColor: blackColor,
  //                                   toggleColor: whiteColor,
  //                                   onToggle: (val) {
  //                                     authController.check.value = val;
  //                                   },
  //                                 ))),
  //                       ),
  //                       paddingAll(
  //                           0.0,
  //                           0.0,
  //                           10.0,
  //                           0.0,
  //                           Container(
  //                             width: getWidth(context) * 0.80,
  //                             // height: 40,
  //                             // color: pinkColor,
  //                             child: RichText(
  //                                 text: TextSpan(children: [
  //                               const TextSpan(
  //                                   text: 'I agree to the ',
  //                                   style: TextStyle(
  //                                     fontSize: 13.0,
  //                                     fontFamily: 'Quicksand Regular',
  //                                     color: grayColor,
  //                                   )),
  //                               TextSpan(
  //                                 text: 'Terms and Conditions ',
  //                                 style: const TextStyle(
  //                                   fontSize: 13.0,
  //                                   fontFamily: 'Quicksand Medium',
  //                                   color: blackColor,
  //                                 ),
  //                                 recognizer: TapGestureRecognizer()
  //                                   ..onTap = () async =>
  //                                       Get.to(const TermsAndConditionScreen()),
  //                               ),
  //                               const TextSpan(
  //                                   text: 'and ',
  //                                   style: TextStyle(
  //                                     fontSize: 13.0,
  //                                     fontFamily: 'Quicksand Regular',
  //                                     color: grayColor,
  //                                   )),
  //                               TextSpan(
  //                                 text: 'Privacy Policy.',
  //                                 style: const TextStyle(
  //                                   fontSize: 13.0,
  //                                   fontFamily: 'Quicksand Medium',
  //                                   color: blackColor,
  //                                 ),
  //                                 recognizer: TapGestureRecognizer()
  //                                   ..onTap = () async =>
  //                                       Get.to(PrivacyPolicyScreen()),
  //                               ),
  //                             ])),
  //                           )),
  //                     ],
  //                   ),
  //                   Obx(() => authController.check.value
  //                       ? SizedBox()
  //                       : paddingAll(
  //                           8.0,
  //                           0.0,
  //                           0.0,
  //                           0.0,
  //                           customTextLeft(authController.message.value, 13.0,
  //                               'Quicksand Medium', redColor),
  //                         )),
  //                 ],
  //               ),
  //             )),
  //         joinUsButton(),
  //         Obx(() => paddingAll(
  //             getHeight(context) * 0.10,
  //             0.0,
  //             0.0,
  //             0.0,
  //             Center(
  //               child: customText(
  //                   'App version v${authController.version.value.toString()}',
  //                   12.0,
  //                   'Quicksand Regular',
  //                   appVersionColor,
  //                   1.0),
  //             )))
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 2.0),
                      ),
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      automaticIndicatorColorAdjustment: false,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      controller: tabController,
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Tab(
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Quicksand Regular'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Tab(
                            child: Text(
                              'Join Us',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Quicksand Regular'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 15, left: 15),
                  child: SizedBox(
                    height: Get.height * 0.64,
                    child: TabBarView(
                      // physics: NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: const [
                        Login(),
                        JoinUs(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JoinUs extends StatelessWidget {
  const JoinUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<AuthController>().joinUsFormKey,
      child: Column(
        children: const [
          // EmailTextFeild(),
          NameTextField(),
          SizedBox(
            height: 20,
          ),
          MobileNumberTextField(),
          SizedBox(
            height: 20,
          ),
          EmailTextFeild(),
          SizedBox(
            height: 20,
          ),
          PasswordTextField(),
          SizedBox(
            height: 20,
          ),
          // PasswordTextField(),
          // Align(
          //   alignment: Alignment.center,
          //   child: LoginButton(),
          // ),
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.disabled,
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      controller: Get.find<AuthController>().nameController,
      minLines: 1,
      onSaved: (value) {
        Get.find<AuthController>().name = value!;
      },
      validator: (value) {
        return Get.find<AuthController>().validateName(value!);
      },
      decoration: InputDecoration(
        hintText: 'Enter your name',
        enabled: true,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
            fontSize: 13.0,
            color: Colors.black.withOpacity(0.3),
            fontFamily: 'Quicksand Regular'),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        prefix: const Padding(padding: EdgeInsets.only(left: 20)),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            borderSide: BorderSide(color: Colors.black87, width: 1)),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1),
        ),
      ),
    );
  }
}

class MobileNumberTextField extends StatelessWidget {
  const MobileNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      controller: Get.find<AuthController>().mobileNoController,
      cursorColor: Colors.black,
      onSaved: (value) {
        Get.find<AuthController>().mobileNo = value!;
      },
      validator: (value) {
        return Get.find<AuthController>().validateMobileNo(value!);
      },
      minLines: 1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        hintText: 'Enter your mobile number',
        enabled: true,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
            fontSize: 13.0,
            color: Colors.black.withOpacity(0.3),
            fontFamily: 'Quicksand Regular'),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            width: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    '+ 91',
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black.withOpacity(0.3),
                        fontFamily: 'Quicksand Regular'),
                  ),
                ),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
          ),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            borderSide: BorderSide(color: Colors.black87, width: 1.0)),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          borderSide: BorderSide(color: Colors.black87, width: 1.0),
        ),
      ),
    );
  }
}
