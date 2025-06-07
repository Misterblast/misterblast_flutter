import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLocaleDialog extends StatefulWidget {
  const SelectLocaleDialog({
    super.key,
    required this.locales,
    required this.currentLocale,
    this.formKey,
  });
  final String currentLocale;
  final GlobalKey<FormState>? formKey;
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
      title: Row(
        spacing: 12,
        children: [
          Icon(
            size: 32,
            Icons.label_important_sharp,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            "settings.language.select-language".tr(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.locales.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final isSelected = widget.locales[index]["name"] == _selectedLocale;
            return Material(
              type: MaterialType.transparency,
              child: ListTile(
                minVerticalPadding: 24,
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
                  print(widget.formKey?.currentState ?? "null");
                  setState(() {
                    _selectedLocale = widget.locales[index]["name"];
                  });
                  context.setLocale(
                    Locale(widget.locales[index]["name"]),
                  );
                  if (widget.formKey != null) {
                    widget.formKey!.currentState?.reset();
                  }
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
              ),
            );
          },
        ),
      ),
    );
  }
}
