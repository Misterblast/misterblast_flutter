import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectClassDialog extends StatefulWidget {
  const SelectClassDialog({super.key, required this.subjectName});
  final String subjectName;

  @override
  State<SelectClassDialog> createState() => _SelectClassDialogState();
}

class _SelectClassDialogState extends State<SelectClassDialog> {
  final List<String> _availableClasses = [
    "4",
    "5",
    "6",
  ];
  String? _selectedClass;

  void _onClassSelected(String? value) {
    setState(() {
      _selectedClass = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedClass = _availableClasses.first;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 12,
              children: [
                Icon(
                  size: 32,
                  Icons.label_important_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Expanded(
                  child: Text(
                    maxLines: 2,
                    context.tr("common.class"),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${context.tr("examples.select-class")} : ",
                    style: Theme.of(context).textTheme.headlineSmall),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _availableClasses
                      .map((item) => InkWell(
                            onTap: () => _onClassSelected(item),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: _selectedClass == item
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              child: Text(
                                "${context.tr("common.class")} $item",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _selectedClass == item
                                          ? Colors.white
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary,
                                    ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.visible,
                context.tr(
                  "examples.open-examples-of",
                  namedArgs: {
                    "subject": context.tr("subjects.${widget.subjectName}"),
                    "class": _selectedClass ?? "",
                  },
                ),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
