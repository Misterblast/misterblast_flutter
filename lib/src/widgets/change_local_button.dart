import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/constants/available_locales.dart';
import 'package:misterblast_flutter/src/modules/onboarding/widgets/image_logo_container.dart';
import 'package:misterblast_flutter/src/widgets/select_locale_dialog.dart';

class ChangeLocalButton extends StatelessWidget {
  const ChangeLocalButton({super.key, this.formKey});

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    final currentLocal = AVAILABLE_LOCALES
        .where((locale) => locale["name"] == context.locale.toString())
        .first;
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => SelectLocaleDialog(
          locales: AVAILABLE_LOCALES,
          currentLocale: currentLocal["name"],
          formKey: formKey,
        ),
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
