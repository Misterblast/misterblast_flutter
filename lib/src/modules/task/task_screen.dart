import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/submission_list_notifier.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/task_list_notifier.dart';
import 'package:misterblast_flutter/src/modules/task/widgets/task_submission_tile.dart';
import 'package:misterblast_flutter/src/modules/task/widgets/task_tile.dart';
import 'package:misterblast_flutter/src/providers/user_summary.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_chart.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/default_error_widget.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';
import 'package:misterblast_flutter/src/widgets/stat_chip.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/images/home_decor.png",
              ),
            ),
            Positioned(
              top: 25,
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.asset(
                    "assets/images/tugas-icon.png",
                    scale: 2,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Column(
              spacing: 16,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      ChangeLocalButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          spacing: 8,
                          children: [
                            _TaskList(),
                            _TaskSubmissionList(),
                            _TaskStatistic()
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TaskStatistic extends StatelessWidget {
  const _TaskStatistic();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 12,
          children: [
            Icon(
              Icons.label_important_sharp,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              context.tr("common.stats"),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        Text(
          context.tr("quiz.graph-description"),
        ),
        Consumer(
          builder: (context, ref, child) {
            final userSummaryNotifier = ref.watch(userSummaryProvider);
            final submissions =
                ref.watch(submissionListNotifierProvider(limit: 10)).value ??
                    [];
            return userSummaryNotifier.maybeWhen(
              error: (_, __) => DefaultErrorWidget(),
              orElse: () {
                final summary = userSummaryNotifier.value;
                return Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppChart(
                      lineColor: AppColors.primary,
                      spots: List.generate(
                        10,
                        (i) {
                          final reversedResults = submissions.reversed.toList();
                          return FlSpot(
                            i.toDouble() + 1,
                            i < reversedResults.length
                                ? reversedResults[i].score?.toDouble() ?? 0
                                : 0,
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 3,
                            runSpacing: 6,
                            children: [
                              StatChip(
                                color: AppColors.primary,
                                iconData: Icons.drafts,
                                content:
                                    "${context.tr("stats.task-done")}  : ${summary?.totalTaskAttempts.toStringAsFixed(0) ?? 0}",
                              ),
                              StatChip(
                                color: AppColors.primary,
                                iconData: Icons.align_vertical_bottom,
                                content:
                                    "${context.tr("stats.task-average-score")}  : ${summary?.averageTaskScore.toStringAsFixed(0) ?? 0}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}

class _TaskSubmissionList extends ConsumerWidget {
  const _TaskSubmissionList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissionListNotifier =
        ref.watch(submissionListNotifierProvider(limit: 3));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12,
              children: [
                Icon(
                  Icons.label_important_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  context.tr("task.task-submissions"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            if (!submissionListNotifier.hasError &&
                (submissionListNotifier.value?.isNotEmpty ?? false))
              TextButton(
                onPressed: () => context.push("/task/submission-list"),
                child: Text(
                  context.tr(
                    "common.show-all",
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              )
          ],
        ),
        if (submissionListNotifier.isLoading)
          Column(
            spacing: 4,
            children: List.generate(
              2,
              (index) => ShimmerContainer(
                size: const Size(double.maxFinite, 80),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            ),
          )
        else if (submissionListNotifier.hasError)
          DefaultErrorWidget()
        else if (!submissionListNotifier.isLoading &&
            (submissionListNotifier.value?.isEmpty ?? true))
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              Image.asset(
                "assets/images/empty-task.png",
                height: 200,
              ),
              Text(
                "task.task-no-works".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: AppFontSizes.sm,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          )
        else if (submissionListNotifier.value?.isNotEmpty ?? false)
          Column(
            children: submissionListNotifier.value!
                .map(
                  (submission) =>
                      TaskSubmissionTile(taskSubmission: submission),
                )
                .toList(),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}

class _TaskList extends ConsumerWidget {
  const _TaskList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListNotifier = ref.watch(taskListNotifierProvider(limit: 2));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12,
              children: [
                Icon(
                  Icons.label_important_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  context.tr("task.do-task"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TextButton(
              onPressed: () => context.push("/task/task-list"),
              child: Text(
                context.tr(
                  "common.show-all",
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            )
          ],
        ),
        if (taskListNotifier.isInitialLoading)
          Column(
            spacing: 4,
            children: List.generate(
              2,
              (index) => ShimmerContainer(
                size: const Size(double.maxFinite, 80),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            ),
          )
        else if (taskListNotifier.isError)
          DefaultErrorWidget()
        else if (taskListNotifier.tasks.isEmpty)
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              Image.asset(
                "assets/images/empty-task.png",
                height: 200,
              ),
              Text(
                "task.task-no-works".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: AppFontSizes.sm,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          )
        else if (taskListNotifier.tasks.isNotEmpty)
          Column(
            children: taskListNotifier.tasks
                .map((task) => TaskTile(item: task))
                .toList(),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}
