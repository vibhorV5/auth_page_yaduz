import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';

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
          child: SizedBox(
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
