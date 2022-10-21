import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:yaduz_login_join_us/Constants/constants.dart';
import 'package:yaduz_login_join_us/Services/BasicAuth/basic_auth.dart';

class AuthServices {
  Future<dynamic> loginUser(emailId, password, deviceId, deviceVersion) async {
    try {
      print('loginUser');
      print(emailId);
      var basicAuth = await authHeader();
      var url = Uri.parse('${Constants.baseUrl}${Constants.login}');
      var response = await http.post(url, headers: <String, String>{
        'authorization': basicAuth,
        'Accept-Language': Constants.acceptedLanguage,
        'platform': Platform.operatingSystem,
        'version': deviceVersion,
        'device-id': deviceId
      }, body: {
        'email': emailId,
        'password': password,
        'country_id': Constants.countryId,
      });
      // print(response);
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }

  Future<dynamic> registerUser(name, phone, registerEmailId, registerPassword,
      deviceId, deviceVersion) async {
    try {
      var basicAuth = await authHeader();
      var url = Uri.parse('${Constants.baseUrl}${Constants.register}');
      var response = await http.post(url, headers: <String, String>{
        'authorization': basicAuth,
        'Accept-Language': Constants.acceptedLanguage,
        'platform': Platform.operatingSystem,
        'version': deviceVersion,
        'device-id': deviceId
      }, body: {
        'name': name,
        'phone': phone,
        'email': registerEmailId,
        'password': registerPassword,
        'country_id': Constants.countryId,
      });
      // print(response);
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }
}
