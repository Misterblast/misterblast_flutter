import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    this.imageAsset = "assets/images/guide-icon.png",
    this.title = "menu.card.app-guide",
    this.description = "menu.card.app-guide-description",
    this.onTap,
  });

  final String imageAsset;
  final String title;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          spacing: 16,
          children: [
            Image.asset(
              imageAsset,
              scale: 3,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    description.tr(
                      namedArgs: {
                        "applicationName": "GoAssessment",
                      },
                    ),
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
