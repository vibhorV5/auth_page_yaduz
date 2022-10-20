import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';

class EmailTextFeild extends StatelessWidget {
  const EmailTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      controller: Get.find<AuthController>().emailIdController,
      minLines: 1,
      onSaved: (value) {
        Get.find<AuthController>().emailId = value!.trim();
      },
      validator: (value) {
        return Get.find<AuthController>().validateEmail(value!.trim());
      },

      decoration: InputDecoration(
        hintText: 'Enter your email id here',
        enabled: true,
        filled: true,
        fillColor: Colors.white /*Colors.red*/,
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
