import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.size, this.backgroundColor});

  final Size? size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.pop,
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
