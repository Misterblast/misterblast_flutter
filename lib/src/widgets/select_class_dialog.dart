import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/providers/resources.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class SelectClassDialog extends ConsumerStatefulWidget {
  const SelectClassDialog(
      {super.key, required this.subjectCode, required this.subjectName});
  final String subjectCode;
  final String subjectName;

  @override
  ConsumerState<SelectClassDialog> createState() => _SelectClassDialogState();
}

class _SelectClassDialogState extends ConsumerState<SelectClassDialog> {
  String? _selectedClass;

  void _onClassSelected(String? value) {
    setState(() {
      _selectedClass = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final classProvider = ref.watch(classesProvider);
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
            classProvider.when(
              data: (classes) => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: classes
                    .map((item) => InkWell(
                          onTap: () => _onClassSelected(item.name),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _selectedClass == item.name
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: Text(
                              "${context.tr("common.class")} ${item.name}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: _selectedClass == item.name
                                        ? Colors.white
                                        : Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              error: (err, _) {
                logger.e("Error fetching classes: $err");
                return Text(context.tr("exceptions.unknown-error"));
              },
              loading: () => Row(
                spacing: 4,
                children: List.generate(
                  3,
                  (index) => ShimmerContainer(
                    size: const Size(75, 35),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _selectedClass != null
                  ? () {
                      context.pop();
                      context.push(
                          '/examples/example-questions?subjectCode=${widget.subjectCode}&className=$_selectedClass&subjectName=${widget.subjectName}');
                    }
                  : null,
              child: AutoSizeText(
                maxLines: 2,
                minFontSize: 12,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                context.tr(
                  "examples.open-examples-of",
                  namedArgs: {
                    "subject": context.tr("subjects.${widget.subjectCode}"),
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
