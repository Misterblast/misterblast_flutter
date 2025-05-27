import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/constants/subjects.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';

class SearchQuestionTile extends StatelessWidget {
  const SearchQuestionTile({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final subject = AVAILABLE_SUBJECTS.firstWhere(
      (subject) => subject['title'] == question.lesson_name,
    );
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () => context.push(
          '/examples/example-questions?subjectCode=${subject['code']}&className=${question.class_name}&subjectName=${question.lesson_name}&initialSetId=${question.set_id}',
        ),
        contentPadding: const EdgeInsets.all(8),
        title: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withAlpha(50),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                context.tr("question-answer-types.${question.format}"),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            Row(
              spacing: 8,
              children: [
                Image.asset(
                  height: 48,
                  width: 48,
                  "assets/images/${subject['icon']}",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${context.tr("subjects.${subject['code']}")} - ${context.tr("common.class")} ${question.class_name}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      question.set_name ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        subtitle: AppMarkdownViewer(content: question.content),
      ),
    );
  }
}
