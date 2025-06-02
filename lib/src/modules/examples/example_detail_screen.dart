import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/examples/widgets/example_sets_options.dart';
import 'package:misterblast_flutter/src/modules/examples/widgets/question_list.dart';
import 'package:misterblast_flutter/src/providers/resources.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class ExampleDetailScreen extends ConsumerStatefulWidget {
  const ExampleDetailScreen({
    super.key,
    required this.subjectCode,
    required this.subjectName,
    required this.className,
    this.initialSetId,
  });

  final String subjectCode;
  final String subjectName;
  final String className;
  final int? initialSetId;

  @override
  ConsumerState<ExampleDetailScreen> createState() =>
      _ExampleDetailScreenState();
}

class _ExampleDetailScreenState extends ConsumerState<ExampleDetailScreen> {
  int? _selectedSet;

  @override
  void initState() {
    ref.listenManual(
      exampleSetsProvider(
        className: widget.className,
        lessonName: widget.subjectName,
      ),
      (_, sets) {
        sets.whenData(
            (data) => _selectedSet ??= (widget.initialSetId ?? data.first.id));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sets = ref.watch(
      exampleSetsProvider(
        className: widget.className,
        lessonName: widget.subjectName,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Text(
          "${context.tr("subjects.${widget.subjectCode}")} ${context.tr("common.class")} ${widget.className}",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sets.when(
              data: (sets) => ExampleSetsOptions(
                sets: sets,
                selectedSetId: _selectedSet,
                onSetSelected: (setId) {
                  setState(() => _selectedSet = setId);
                  //invalidate questions
                },
              ),
              error: (error, stack) => Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              loading: () => Row(
                spacing: 8,
                children: List.generate(
                  3,
                  (index) => ShimmerContainer(
                    size: const Size(60, 30),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
            if (_selectedSet != null)
              QuestionList(
                setName: sets.asData?.value
                        .firstWhere((set) => set.id == _selectedSet)
                        .name ??
                    '',
              )
          ],
        ),
      ),
    );
  }
}
