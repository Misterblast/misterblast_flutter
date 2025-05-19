import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:misterblast_flutter/src/themes/theme.dart';

class StatChip extends StatelessWidget {
  const StatChip({
    super.key,
    required this.content,
    this.iconData,
    this.color,
  });

  final String? content;
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.coolTeal,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          iconData != null
              ? Icon(
                  iconData,
                  color: Colors.white,
                  size: 20,
                )
              : const SizedBox.shrink(),
          AutoSizeText(
            content ?? "",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSizes.md,
                ),
          ),
        ],
      ),
    );
  }
}
