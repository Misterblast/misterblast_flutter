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
        builder: (context) => SelectLocaleDialog(
          locales: locales,
          currentLocale: currentLocal["name"],
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

class SelectLocaleDialog extends StatefulWidget {
  const SelectLocaleDialog({
    super.key,
    required this.locales,
    required this.currentLocale,
  });
  final String currentLocale;
  final List<Map<String, dynamic>> locales;

  @override
  State<SelectLocaleDialog> createState() => _SelectLocaleDialogState();
}

class _SelectLocaleDialogState extends State<SelectLocaleDialog> {
  String? _selectedLocale;

  @override
  void initState() {
    _selectedLocale = widget.currentLocale;
    super.initState();
  }

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
          itemCount: widget.locales.length,
          itemBuilder: (context, index) {
            final isSelected = widget.locales[index]["name"] == _selectedLocale;
            return ListTile(
              selected: isSelected,
              selectedTileColor:
                  Theme.of(context).colorScheme.secondary.withAlpha(75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 1,
                ),
              ),
              selectedColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.all(0),
              onTap: () {
                context.setLocale(
                  Locale(widget.locales[index]["name"]),
                );
                Navigator.pop(context);
              },
              leading: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    image: AssetImage(widget.locales[index]["flag"]),
                  ),
                ),
              ),
              title: Text(widget.locales[index]["label"]),
            );
          },
        ),
      ),
    );
  }
}
