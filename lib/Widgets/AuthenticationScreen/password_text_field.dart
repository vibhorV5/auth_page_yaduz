import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.onSaved,
    required this.validator,
  });

  final TextEditingController? passwordController;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
        // enableInteractiveSelection: false,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        obscureText: Get.find<AuthController>().visible.value,
        controller: passwordController,
        minLines: 1,
        onSaved: onSaved,
        validator: validator,
        toolbarOptions: const ToolbarOptions(
          copy: false,
          cut: false,
        ),
        decoration: InputDecoration(
          hintText: 'Enter password',
          enabled: true,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            splashColor: Colors.white,
            onPressed: () async {
              Get.find<AuthController>().visible.value =
                  !Get.find<AuthController>().visible.value;
            },
            icon: Icon(Get.find<AuthController>().visible.value
                ? Icons.circle
                : Icons.circle_outlined),
          ),
          hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.black.withOpacity(0.3),
              fontFamily: 'Quicksand Regular'),
          contentPadding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 5.0, right: 0.0),
          isDense: true,
          alignLabelWithHint: false,
          prefix: const Padding(padding: EdgeInsets.only(left: 20)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  0.0,
                ),
              ),
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
        )));
  }
}
