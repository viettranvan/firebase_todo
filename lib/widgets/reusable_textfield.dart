import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    this.textInputAction,
    this.errorText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final String? errorText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          errorText: errorText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0)
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon
      ),
    );
  }
}
