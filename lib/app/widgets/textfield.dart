import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String labelText;

  const MyTextfield({
    super.key,
    this.hintText = '',
    this.obscureText = false,
    this.suffixIcon = const SizedBox(),
    required this.prefixIcon,
    required this.controller,
    this.labelText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: obscureText,
          controller: controller,
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
        ),
      ],
    );
  }
}
