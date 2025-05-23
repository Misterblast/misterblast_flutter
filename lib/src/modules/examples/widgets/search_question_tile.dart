import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
        contentPadding: const EdgeInsets.all(8),
        title: Row(
          spacing: 8,
          children: [
            Image.asset(
              height: 48,
              width: 48,
              "assets/images/${subject['icon']}",
            ),
            Text(
              "${context.tr("subjects.${subject['code']}")} - ${context.tr("common.class")} ${question.class_name}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        subtitle: AppMarkdownViewer(content: question.content),
      ),
    );
  }
}
