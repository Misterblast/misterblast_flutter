import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/constants/subjects.dart';
import 'package:misterblast_flutter/src/models/class.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/providers/resources.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

// ignore: must_be_immutable
class SelectSubjectSheet extends StatefulWidget {
  const SelectSubjectSheet({
    super.key,
    this.showClass = true,
    this.showSubject = true,
    this.isLoading = false,
  });

  final bool isLoading;

  final bool showClass;
  final bool showSubject;

  @override
  State<SelectSubjectSheet> createState() => _SelectSubjectSheetState();
}

class _SelectSubjectSheetState extends State<SelectSubjectSheet> {
  Lesson? _selectedSubject;
  Class? _selectedClass;

  onSubmit() {
    if (widget.isLoading) return null;

    if (widget.showSubject &&
        widget.showClass &&
        _selectedSubject != null &&
        _selectedClass != null) {
      return () => context.pop((_selectedSubject, _selectedClass));
    }

    if (widget.showSubject && _selectedSubject != null) {
      return () => context.pop(_selectedSubject);
    }

    if (widget.showClass && _selectedClass != null) {
      return () => context.pop(_selectedClass);
    }

    return null;
  }

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
                if (widget.showClass)
                  Consumer(
                    builder: (context, ref, child) {
                      final classState = ref.watch(classesProvider);
                      return classState.when(
                        data: (classes) {
                          if (classes.isEmpty) {
                            return Text(
                              context.tr("common.no-classes"),
                              style: Theme.of(context).textTheme.bodyLarge,
                            );
                          }
                          return Column(
                            spacing: 12,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Icon(
                                    size: 32,
                                    Icons.class_,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(
                                    "common.class".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ],
                              ),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: classes
                                    .map(
                                      (item) => ChoiceChip(
                                        label: Text(item.name),
                                        selected: _selectedClass?.id == item.id,
                                        onSelected: (selected) {
                                          setState(() {
                                            _selectedClass =
                                                selected ? item : null;
                                          });
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          );
                        },
                        error: (error, stackTrace) => Text(
                          context.tr("common.error-loading-classes"),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        loading: () => Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            3,
                            (index) => ShimmerContainer(
                              size: const Size(60, 30),
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (widget.showSubject)
                  Consumer(
                    builder: (context, ref, child) {
                      final subjectState = ref.watch(lessonsProvider);
                      return subjectState.when(
                        data: (subjects) {
                          if (subjects.isEmpty) {
                            return Text(
                              context.tr("common.no-subjects"),
                              style: Theme.of(context).textTheme.bodyLarge,
                            );
                          }
                          return Column(
                            spacing: 12,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Icon(
                                    size: 32,
                                    Icons.label_important_sharp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(
                                    "common.subject".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ],
                              ),
                              Column(
                                spacing: 6,
                                mainAxisSize: MainAxisSize.min,
                                children: subjects.map(
                                  (subject) {
                                    final subjectIcon = AVAILABLE_SUBJECTS
                                        .firstWhere((availableSubject) =>
                                            availableSubject['code'] ==
                                            subject.code)['icon'];
                                    final isSelected =
                                        _selectedSubject?.id == subject.id;
                                    return Card(
                                      child: ListTile(
                                        selected: isSelected,
                                        selectedTileColor: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withAlpha(75),
                                        contentPadding:
                                            const EdgeInsets.all(16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: BorderSide(
                                            width: 2,
                                            color: isSelected
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Colors.transparent,
                                          ),
                                        ),
                                        horizontalTitleGap: 16,
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            "assets/images/$subjectIcon",
                                            width: 75,
                                          ),
                                        ),
                                        title: Text(
                                          "subjects.${subject.code}".tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: isSelected
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primary
                                                    : Colors.black,
                                              ),
                                        ),
                                        onTap: () => setState(() {
                                          _selectedSubject = subject;
                                        }),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          );
                        },
                        error: (error, stackTrace) => Text(
                          context.tr("common.error-loading-subjects"),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        loading: () => Column(
                          spacing: 8,
                          children: List.generate(
                            4,
                            (index) => ShimmerContainer(
                              size: const Size(double.maxFinite, 80),
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onSubmit(),
            child: widget.isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    constraints: BoxConstraints(minHeight: 24, minWidth: 24),
                  )
                : Text("quiz.do-quiz".tr()),
          )
        ],
      ),
    );
  }
}
