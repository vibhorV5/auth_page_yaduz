import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/View/authentication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yaduz login join_us',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const AuthenticationScreen(),
    );
  }
}
