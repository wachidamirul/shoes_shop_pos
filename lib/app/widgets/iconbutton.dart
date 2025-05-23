import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/theme/color_theme.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';

class MyIconButton extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final Widget icon;
  final VoidCallback onPressed;
  const MyIconButton({
    super.key,
    required this.label,
    this.labelStyle,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style:
              labelStyle ??
              FontTheme.semibold.copyWith(
                fontSize: 14,
                color: ColorTheme.darkGray,
              ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.indigo.shade200, width: 2),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        ),
      ),
    );
  }
}
