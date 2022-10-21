import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Constants/constants.dart';
import 'package:yaduz_login_join_us/Screens/Home/View/home_screen.dart';
import 'package:yaduz_login_join_us/Services/Authentication/auth_services.dart';
import 'package:yaduz_login_join_us/Utility/utility.dart';

class AuthController extends GetxController {
  RxString deviceId = ''.obs;
  String? deviceVersion;

  bool loginStatus = false;

  final authServices = AuthServices();
  final utility = Utility();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> joinUsFormKey = GlobalKey<FormState>();

  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController registerEmailIdController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    deviceId.value = await utility.getDeviceId();
    deviceVersion = await utility.getAndroidVersion();
    version.value = await utility.appVersion();
  }

  @override
  void onClose() {
    super.onClose();
    emailIdController.dispose();
    passwordController.dispose();
    registerEmailIdController.dispose();
    registerPasswordController.dispose();
    nameController.dispose();
    mobileNoController.dispose();
  }

  var emailId = '';
  var password = '';
  var registerPassword = '';
  var registerEmailId = '';
  var name = '';
  var mobileNo = '';

//data fetched
  var nameR = '';
  var emailR = '';

  RxBool visible = true.obs;
  RxString version = "".obs;

  RxString message = "".obs;

  RxBool check = false.obs;

  String? validateMobileNo(String value) {
    if (value.length < 10) {
      return "Enter a valid mobile number";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Enter password 8+ chars long";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Enter first name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Enter a valid Email id";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      loginStatus = false;
      return;
    } else {
      loginFormKey.currentState!.save();
      loginStatus = true;
    }
  }

  //login user Method with status codes
  Future<void> loginUser() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      print('not valid form');
      Get.back();
      return;
    } else {
      loginFormKey.currentState!.save();
      final response = await authServices.loginUser(
          emailId, password, deviceId.value, deviceVersion);
      if (response == " ") {
        Get.back();
        utility.customToast(Constants.checkInternetConnection, Colors.red,
            Colors.red.withOpacity(0.2), "Error");
        // customSnackBar(Constants.connectionFailed,Constants.checkInternetConnection);
      } else if (response is http.Response) {
        if (response.statusCode == 404) {
          print(response.body.toString());
          Map mapdata = jsonDecode(response.body.toString());
          Get.back();
          utility.customToast(mapdata['message'][0], Colors.red,
              Colors.red.withOpacity(0.2), "Error");
          // customSnackBar(Constants.failed, mapdata['message'][0]);
        } else if (response.statusCode == 500) {
          Map mapdata = jsonDecode(response.body.toString());
          Get.back();
          utility.customToast(Constants.checkServerConnection, Colors.red,
              Colors.red.withOpacity(0.2), "Error");
          // customSnackBar(Constants.connectionFailed,Constants.checkServerConnection);
        } else if (response.statusCode == 200) {
          Map mapdata = jsonDecode(response.body.toString());
          if (mapdata['success'] == '0') {
            Get.back(closeOverlays: true);
            utility.customToast(mapdata['message'], Colors.red,
                Colors.red.withOpacity(0.2), "Error");
            // customSnackBar(Constants.pleaseTryAgain, mapdata['message']);
          } else {
            Get.back();
            // saveToken(mapdata['data']['remember_token']);
            // Get.offAllNamed(bottomNavBarRoute);
            print('hello');
            print(mapdata['data']['name']);
            nameR = mapdata['data']['name'];
            print(mapdata['data']['email']);
            emailR = mapdata['data']['email'];
            Get.to(() => const HomeScreen());
          }
          print(mapdata);
        }
      }
    }
  }

  //register user method with status codes
  Future<void> registerUser() async {
    final isValid = joinUsFormKey.currentState!.validate();
    if (!isValid) {
      print('not valid form');
      Get.back();
      return;
    } else {
      joinUsFormKey.currentState!.save();
      final response = await authServices.registerUser(name, mobileNo,
          registerEmailId, registerPassword, deviceId.value, deviceVersion);
      if (response == " ") {
        Get.back();
        utility.customToast(Constants.checkInternetConnection, Colors.red,
            Colors.red.withOpacity(0.2), "Error");
        // customSnackBar(Constants.connectionFailed,Constants.checkInternetConnection);
      } else if (response is http.Response) {
        if (response.statusCode == 404) {
          Map mapdata = jsonDecode(response.body.toString());
          Get.back();
          utility.customToast(mapdata['message'][0], Colors.red,
              Colors.red.withOpacity(0.2), "Error");
          // customSnackBar(Constants.failed, mapdata['message'][0]);
        } else if (response.statusCode == 500) {
          Map mapdata = jsonDecode(response.body.toString());
          Get.back();
          utility.customToast(Constants.checkServerConnection, Colors.red,
              Colors.red.withOpacity(0.2), "Error");
          // customSnackBar(Constants.connectionFailed,Constants.checkServerConnection);
        } else if (response.statusCode == 200) {
          Map mapdata = jsonDecode(response.body.toString());
          if (mapdata['success'] == '0') {
            Get.back();
            utility.customToast(mapdata['message'], Colors.red,
                Colors.red.withOpacity(0.2), "Error");
            // customSnackBar(Constants.failed, mapdata['message']);
          } else {
            Get.back();
            print('hello');
            print(mapdata['data']['name']);
            nameR = mapdata['data']['name'];
            print(mapdata['data']['email']);
            emailR = mapdata['data']['email'];

            Get.to(() => const HomeScreen());

            // saveToken(mapdata['data']['remember_token']);
            // Get.offAllNamed(bottomNavBarRoute);
          }
          print(mapdata);
        }
      }
    }
  }
}
