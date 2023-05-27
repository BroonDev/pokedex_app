import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color color;

  const ShimmerWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.shapeBorder,
    required this.color,
  }) : super(key: key);

  static const _roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  const ShimmerWidget.rectangular({
    Key? key,
    required this.width,
    required this.height,
    this.color = AppColors.mediumColor,
  })  : shapeBorder = _roundedRectangleBorder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color.withOpacity(0.8),
      highlightColor: color,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: color.withOpacity(0.8),
          shape: shapeBorder,
        ),
      ),
    );
  }
}
