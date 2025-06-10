import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLinkWidget extends StatelessWidget {
  const AppLinkWidget({
    super.key,
    required this.url,
    this.label = 'common.attachment',
  });
  final String label;
  final String url;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(label),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse(
                      url,
                    ),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: Icon(
                  Icons.open_in_new,
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                url,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
