import 'package:flutter/material.dart';

import 'colors.dart';

class MyShadowStyle {
  static final productItemShadow = BoxShadow(
    color: MyColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50.0,
    spreadRadius: 7.0,
    offset: const Offset(0, 2),
  );
}
