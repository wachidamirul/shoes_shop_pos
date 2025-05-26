import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../widgets/custom_shapes/containers/circular_container.dart';
import '../../../widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class MyPrimaryHeaderContainer extends StatelessWidget {
  const MyPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgeWidget(
      child: SizedBox(
        height: 400,
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
            ],
          ),
        ),
      ),
    );
  }
}
