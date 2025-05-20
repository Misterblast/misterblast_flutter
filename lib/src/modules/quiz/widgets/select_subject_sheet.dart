import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class SelectSubjectSheet extends StatefulWidget {
  const SelectSubjectSheet({super.key});

  @override
  State<SelectSubjectSheet> createState() => _SelectSubjectSheetState();
}

class _SelectSubjectSheetState extends State<SelectSubjectSheet> {
  String? _selectedSubject;
  String? _selectedClass;

  static List<Map<String, dynamic>> subjects = [
    {"icon": "math-icon.png", "title": "mathematics"},
    {"icon": "pancasila-icon.png", "title": "civics"},
    {"icon": "bindo-icon.png", "title": "indonesian"},
    {"icon": "ipas-icon.png", "title": "science"},
  ];

  final List<String> availableClasses = [
    "4",
    "5",
    "6",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                Column(
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
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      children: availableClasses
                          .map(
                            (item) => InkWell(
                              onTap: () => setState(() {
                                _selectedClass = item;
                              }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _selectedClass == item
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                Column(
                  spacing: 12,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        Icon(
                          size: 32,
                          Icons.label_important_sharp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          "common.subject".tr(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 6,
                      mainAxisSize: MainAxisSize.min,
                      children: subjects
                          .map(
                            (subject) => Card(
                              child: ListTile(
                                selected: _selectedSubject == subject['title'],
                                selectedTileColor: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withAlpha(75),
                                contentPadding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    width: 2,
                                    color: _selectedSubject == subject['title']
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                  ),
                                ),
                                horizontalTitleGap: 16,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/images/${subject['icon']}",
                                    width: 75,
                                  ),
                                ),
                                title: Text(
                                  "subjects.${subject['title']}".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color:
                                            _selectedSubject == subject['title']
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Colors.black,
                                      ),
                                ),
                                onTap: () => setState(() {
                                  _selectedSubject = subject['title'];
                                }),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _selectedSubject != null && _selectedClass != null
                ? () => context.pop((_selectedSubject, _selectedClass))
                : null,
            child: Text("quiz.do-quiz".tr()),
          )
        ],
      ),
    );
  }
}
