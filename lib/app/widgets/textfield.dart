import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon = const SizedBox(),
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo.shade200, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo.shade500, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        labelText: labelText,
        labelStyle: FontTheme.medium.copyWith(
          fontSize: 14,
          color: Colors.indigo.shade500,
        ),
        hintText: hintText,
        hintStyle: FontTheme.medium.copyWith(
          fontSize: 14,
          color: Colors.grey.shade500,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
