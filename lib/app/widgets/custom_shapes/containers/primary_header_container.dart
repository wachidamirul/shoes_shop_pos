import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class MyPrimaryHeaderContainer extends StatelessWidget {
  const MyPrimaryHeaderContainer({
    super.key,
    this.height = 200,
    required this.child,
  });

  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgeWidget(
      child: SizedBox(
        height: height,
        child: Container(
          color: MyColors.primary,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: MyCircularContainer(
                  backgroundColor: MyColors.darkContainer,
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: MyCircularContainer(
                  backgroundColor: MyColors.darkContainer,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
