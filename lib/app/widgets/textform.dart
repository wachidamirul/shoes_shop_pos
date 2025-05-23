import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';

class MyTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final bool obscureText;
  final IconData suffixIcon;
  final VoidCallback? onChanged;

  const MyTextForm({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.suffixIcon = Icons.check,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.grey.shade500,
      style: FontTheme.medium.copyWith(
        fontSize: 14,
        color:
            Brightness.light == Theme.of(context).brightness
                ? Colors.grey.shade700
                : Colors.grey.shade400,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(
                  context,
                ).inputDecorationTheme.enabledBorder?.borderSide.color ??
                Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(
                  context,
                ).inputDecorationTheme.focusedBorder?.borderSide.color ??
                Colors.indigo,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        filled: true,
        labelText: labelText,
        labelStyle: FontTheme.medium.copyWith(
          fontSize: 14,
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
        ),
        hintText: hintText,
        hintStyle: FontTheme.medium.copyWith(
          fontSize: 12,
          color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).inputDecorationTheme.prefixIconColor,
        ),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color:
                        Theme.of(context).inputDecorationTheme.suffixIconColor,
                  ),
                  onPressed: onChanged,
                )
                : null,
      ),
    );
  }
}
