import 'package:flutter/material.dart';

class MyProductPriceText extends StatelessWidget {
  const MyProductPriceText({
    super.key,
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String price;
  final bool isLarge;
  final int maxLines;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style:
          isLarge
              ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              )
              : Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              ),
    );
  }
}
