import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onTap;
  const MyButton({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text('TAP', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
