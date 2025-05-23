import 'package:flutter/material.dart';
import 'package:shoes_shop_pos/app/theme/font_theme.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String label;
  const MyButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: FontTheme.medium.copyWith(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
