import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:yaduz_login_join_us/Constants/constants.dart';

Future<String> authHeader() async {
  debugPrint("auth header");
  String basicAuth = 'Basic ' +
      base64Encode(utf8.encode('${Constants.username}:${Constants.password}'));
  return basicAuth;
}
