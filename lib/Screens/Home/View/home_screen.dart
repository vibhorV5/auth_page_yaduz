import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Text('Name: ${Get.find<AuthController>().nameR}'),
                Text('Email Id: ${Get.find<AuthController>().emailR}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
