import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';

class MyTextForm extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextEditingController controller;

  const MyTextForm({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff1f1f5),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: FontTheme.regular.copyWith(
            fontSize: 14,
            color: Color(0xffa1a1aa),
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
