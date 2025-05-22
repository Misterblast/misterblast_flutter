import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer_explanation.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';

class QuestionAnswerExplanationTile extends StatelessWidget {
  const QuestionAnswerExplanationTile({
    super.key,
    required this.answerExplanation,
  });

  final QuizAnswerExplanation answerExplanation;

  @override
  Widget build(BuildContext context) {
    final Color widgetColor =
        answerExplanation.isCorrect ? AppColors.primary : AppColors.danger;
    return ExpansionTile(
      collapsedIconColor: widgetColor,
      iconColor: widgetColor,
      leading: Icon(
        answerExplanation.isCorrect ? Icons.check_circle_rounded : Icons.cancel,
        color: widgetColor,
      ),
      title: Text("${context.tr("common.number")} ${answerExplanation.number}",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: widgetColor,
              )),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "${context.tr("quiz-result.your-answer")} : ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: widgetColor,
                  ),
              children: [
                TextSpan(
                  text: answerExplanation.userCode,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: widgetColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "${context.tr("quiz-result.correct-answer")} : ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: widgetColor,
                  ),
              children: [
                TextSpan(
                  text: answerExplanation.actualCode,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: widgetColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 1,
          color: widgetColor,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 1,
          color: widgetColor,
        ),
      ),
      backgroundColor: widgetColor.withAlpha(75),
      collapsedBackgroundColor: widgetColor.withAlpha(75),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      children: [
        Divider(
          color: widgetColor,
          height: 1,
        ),
        Container(
          color: Colors.white,
          width: double.maxFinite,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 12,
                children: [
                  Icon(
                    size: 24,
                    Icons.label_important_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    context.tr("common.question"),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              AppMarkdownViewer(content: answerExplanation.questionContent),
              const SizedBox(height: 8),
              Row(
                spacing: 12,
                children: [
                  Icon(
                    size: 24,
                    Icons.label_important_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    context.tr("common.explanation"),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              AppMarkdownViewer(content: answerExplanation.explanation),
              const SizedBox(height: 8),
              Row(
                spacing: 12,
                children: [
                  Icon(
                    size: 24,
                    Icons.label_important_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    context.tr("common.reason"),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              AppMarkdownViewer(content: answerExplanation.reason),
            ],
          ),
        ),
      ],
    );
  }
}
