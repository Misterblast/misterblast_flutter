import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/constants/subjects.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer_explanation.dart';
import 'package:misterblast_flutter/src/modules/quiz/providers/quiz_result_notifier.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/quiz_answer_explanation_tile.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

Widget rowSubmissionDetail(BuildContext context, String label, String? value,
    [Color? valueColor]) {
  return Row(
    spacing: 6,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      Text(
        ":",
        style: Theme.of(context).textTheme.titleSmall,
      ),
      Expanded(
        child: Text(
          value ?? "-",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: valueColor ?? Colors.black),
        ),
      ),
    ],
  );
}

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key, required this.resultId});
  final int resultId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: AutoSizeText(
          maxLines: 1,
          "${context.tr("")} ${context.tr("")}",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: SafeArea(
        child: Column(
          spacing: 24,
          children: [
            Column(
              children: [
                Text(
                  context.tr("quiz-result.score"),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final result =
                        ref.watch(quizResultNotifierProvider(resultId));

                    if (result.isLoading) {
                      return ShimmerContainer(size: const Size(100, 120));
                    }

                    if (result.hasError) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: const Icon(
                          size: 48,
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          result.value?.grade ?? "0",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.white, fontSize: 60),
                        ),
                        Text(
                          " / 100",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SubmissionDetails(submissionId: resultId),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubmissionDetails extends ConsumerWidget {
  const SubmissionDetails({
    super.key,
    required this.submissionId,
  });

  final int submissionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizExplanation = ref.watch(quizResultNotifierProvider(submissionId));
    final isLoading = quizExplanation.isLoading;
    final hasError = quizExplanation.hasError;
    final data = quizExplanation.value;
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: 8,
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
                  context.tr("quiz-result.submission-details"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rowSubmissionDetail(
                  context,
                  context.tr("quiz-result.correct-answer-count"),
                  data?.correct.toString(),
                  AppColors.primary,
                ),
                rowSubmissionDetail(
                  context,
                  context.tr("quiz-result.incorrect-answer-count"),
                  data?.wrong.toString(),
                  AppColors.danger,
                ),
                rowSubmissionDetail(
                  context,
                  context.tr("quiz-result.submitted-at"),
                  parseUnixDatetime(
                    data?.submittedAt,
                    locale: context.locale.countryCode,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          spacing: 8,
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
                  context.tr("common.subject"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            if (isLoading)
              ShimmerContainer(
                size: const Size(double.maxFinite, 80),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              )
            else
              Builder(builder: (context) {
                final subject = AVAILABLE_SUBJECTS
                    .firstWhere((element) => element['code'] == data?.lesson);
                return Card(
                  child: Material(
                    type: MaterialType.transparency,
                    child: ListTile(
                      selected: false,
                      selectedTileColor:
                          Theme.of(context).colorScheme.secondary.withAlpha(75),
                      contentPadding: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary,
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
                        context.tr("subjects.${subject['code']}"),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      subtitle: Text(
                        "${context.tr("quiz-result.attempt-number")} - ${data?.attemptNo}",
                      ),
                    ),
                  ),
                );
              }),
          ],
        ),
        Column(
          spacing: 8,
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
                  context.tr("common.answer-list"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            if (isLoading)
              ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (_, index) => ShimmerContainer(
                  size: const Size(double.maxFinite, 80),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data?.answers.length ?? 0,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (_, index) {
                  final QuizAnswerExplanation answer = data!.answers[index];
                  return QuestionAnswerExplanationTile(
                    answerExplanation: answer,
                  );
                },
              ),
            const SizedBox.shrink()
          ],
        ),
      ],
    );
  }
}
