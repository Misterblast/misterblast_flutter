import 'package:flutter/material.dart';

class ImageLogoContainer extends StatelessWidget {
  const ImageLogoContainer({
    super.key,
    required this.imagePath,
    this.size,
    this.decoration,
  });

  final Size? size;
  final String imagePath;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width ?? 40,
      height: size?.height ?? 40,
      decoration: decoration ??
          BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
