import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withAlpha(20),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            bottom: -12,
            right: -12,
            child: Opacity(
              opacity: 0.1,
              child: Icon(
                Icons.warning,
                size: 65,
                color: Theme.of(context).colorScheme.errorContainer,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.error,
                  size: 32,
                  color: Theme.of(context).colorScheme.error,
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    context.tr("exceptions.unknown-error"),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
