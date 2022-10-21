import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';

class Utility {
  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    if (Platform.isAndroid) {
      // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = await PlatformDeviceId.getDeviceId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor.toString();
    }
    return deviceId;
  }

  Future<String?> getAndroidVersion() async {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceVersion;
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      deviceVersion = androidInfo.version.release;
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      // var systemName = iosInfo.systemName;
      deviceVersion = iosInfo.systemVersion;
    }
    return deviceVersion;
  }

  appVersion() async {
    PackageInfo? info = await PackageInfo.fromPlatform();
    return info.version.toString();
  }

  Widget customText(text, fontSize, fontFamily, fontColor, height) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        height: height,
      ),
    );
  }

  Widget customTextLeft(text, fontSize, fontFamily, fontColor) {
    return Text(
      text,
      textAlign: TextAlign.start,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }

  customToast(message, Color color, Color backgroundColor, type) {
    return MotionToast(
      height: 50, width: Get.width * 0.95,
      //radiusColor: Colors.green.shade400,
      icon: type == 'Success' ? Icons.check_circle : Icons.cancel,
      borderRadius: 5, iconSize: 30,
      primaryColor: backgroundColor,
      animationType: AnimationType.fromRight,
      // animationDuration:Duration( seconds: 1),
      // toastDuration: Duration( seconds: 1),
      dismissable: true,
      onClose: () {
        Get.back();
      },
      description: customText(message, 15.0, 'Quicksand Medium', color, 0.0),
    ).show(Get.context!);
  }

  showLoading(context) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              // Dialog background
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                /*whiteColor.withOpacity(0.5),*/
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ), // Dialog height
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                )),
                child: Lottie.asset("assets/loader/loader1.json",
                    fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }
}
