import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.size,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
  });
  final Size? size;
  final BorderRadiusGeometry? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? Colors.white,
      baseColor: baseColor ?? Theme.of(context).colorScheme.primary,
      child: Container(
        width: size?.width ?? 100,
        height: size?.height ?? 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}
