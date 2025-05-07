import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/onboarding/widgets/image_logo_container.dart';

class ChangeLocalButton extends StatelessWidget {
  ChangeLocalButton({super.key});

  final List<Map<String, dynamic>> locales = [
    {
      "name": "en",
      "label": "English",
      "flag": "assets/images/uk-flag.png",
    },
    {
      "name": "id",
      "label": "Indonesia",
      "flag": "assets/images/id-flag.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocal = locales
        .where((locale) => locale["name"] == context.locale.toString())
        .first;
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => SelectLocaleDialog(locales: locales),
      ),
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxHeight: 30,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          spacing: 12,
          children: [
            ImageLogoContainer(
              size: Size(20, 20),
              imagePath: currentLocal["flag"],
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
            ),
            Row(
              children: [
                Text(
                  currentLocal["label"],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectLocaleDialog extends StatelessWidget {
  const SelectLocaleDialog({
    super.key,
    required this.locales,
  });

  final List<Map<String, dynamic>> locales;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "settings.language.select-language".tr(),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: locales.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              onTap: () {
                context.setLocale(
                  Locale(locales[index]["name"]),
                );
                Navigator.pop(context);
              },
              leading: Image.asset(locales[index]["flag"]),
              title: Text(locales[index]["label"]),
            );
          },
        ),
      ),
    );
  }
}
