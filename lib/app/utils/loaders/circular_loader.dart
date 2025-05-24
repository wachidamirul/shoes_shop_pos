import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';


/// A circular loader widget with customizable foreground and background colors.
class MyCircularLoader extends StatelessWidget {
  /// Default constructor for the MyCircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const MyCircularLoader({
    super.key,
    this.foregroundColor = MyColors.white,
    this.backgroundColor = MyColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MySizes.lg),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(color: foregroundColor, backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}