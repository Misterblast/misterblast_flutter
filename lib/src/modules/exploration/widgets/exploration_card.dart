import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/exploration/models/exploration.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ExplorationCard extends StatelessWidget {
  const ExplorationCard({
    super.key,
    required this.exploration,
  });

  final Exploration exploration;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Card(
        child: ListTile(
          onTap: () async {
            await launchUrl(
              Uri.parse(
                exploration.siteUrl ?? "",
              ),
              mode: LaunchMode.externalApplication,
            );
          },
          leading: CircleAvatar(
            maxRadius: 25,
            backgroundColor: AppColors.lightBlue,
            onBackgroundImageError: (exception, stackTrace) =>
                const Icon(Icons.error),
            backgroundImage: NetworkImage(
              exploration.imgUrl ?? "",
            ),
          ),
          title: Text(
            exploration.title ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Text(
            exploration.desc ?? "",
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
          ),
          titleAlignment: ListTileTitleAlignment.top,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: Colors.white,
        ),
      ),
    );
  }
}
