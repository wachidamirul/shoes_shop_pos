import 'package:flutter/material.dart';

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
        label: Text(label, style: labelStyle),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        ),
      ),
    );
  }
}
