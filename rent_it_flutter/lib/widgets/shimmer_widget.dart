import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? padding;
  final BorderRadius? borderRadius;

  const RShimmerWidget.rectangle({
    super.key,
    required this.width,
    required this.height,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Padding(
        padding: EdgeInsets.only(right: padding ?? 0),
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
