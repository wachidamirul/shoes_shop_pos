import 'package:flutter/material.dart';

class MySectionHeading extends StatelessWidget {
  const MySectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonText = 'View All',
    required this.title,
    this.child,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonText;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (child != null)
          showActionButton ? Container(child: child) : const SizedBox.shrink(),
      ],
    );
  }
}
