import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.size,
    this.backgroundColor,
    this.onPressed,
  });

  final Size? size;
  final Function()? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? context.pop,
      child: Container(
        width: size?.width ?? 40,
        height: size?.height ?? 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: size?.width ?? 40,
        ),
      ),
    );
  }
}
