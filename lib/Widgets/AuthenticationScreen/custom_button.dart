import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonName,
  });

  final void Function()? onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Text(buttonName),
        ),
      ),
    );
  }
}
