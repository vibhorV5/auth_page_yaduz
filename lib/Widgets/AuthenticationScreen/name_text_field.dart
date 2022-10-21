import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';

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
