import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/modules/exploration/notifiers/exploration_list.dart';
import 'package:misterblast_flutter/src/modules/exploration/widgets/exploration_card.dart';
import 'package:misterblast_flutter/src/modules/quiz/providers/quiz_submission_notifier.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/submission_list_notifier.dart';
import 'package:misterblast_flutter/src/providers/auth.dart';
import 'package:misterblast_flutter/src/providers/user.dart';
import 'package:misterblast_flutter/src/providers/user_summary.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/default_error_widget.dart';
import 'package:misterblast_flutter/src/widgets/menu_card.dart';
import 'package:misterblast_flutter/src/widgets/quiz_chart.dart';
import 'package:misterblast_flutter/src/widgets/quiz_menu_card.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';
import 'package:misterblast_flutter/src/widgets/stat_chip.dart';
import 'package:misterblast_flutter/src/widgets/task_chart.dart';
import 'package:misterblast_flutter/src/widgets/task_menu_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/home_decor.png',
                      width: MediaQuery.sizeOf(context).width * 0.7,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HomeHeaderSection(),
                  _HomeBodySection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeHeaderSection extends ConsumerWidget {
  const _HomeHeaderSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String greetingMessage = "common.good-morning";

    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      greetingMessage = "common.good-morning";
    } else if (hour >= 12 && hour < 17) {
      greetingMessage = "common.good-afternoon";
    } else if (hour >= 17 && hour < 19) {
      greetingMessage = "common.good-evening";
    } else {
      greetingMessage = "common.good-night";
    }

    ref.listen(userProvider, (_, state) {
      state.whenOrNull(error: (_, __) {
        ref.read(authNotifierProvider.notifier).logout();
        context.go('/onboarding');
      });
    });

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final userNotifier = ref.watch(userProvider);
            return userNotifier.when(
              data: (user) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: AppColors.lightBlue,
                          onBackgroundImageError: (exception, stackTrace) =>
                              const Icon(Icons.error),
                          backgroundImage: NetworkImage(
                            userNotifier.value?.imgUrl ?? "",
                          ),
                        ),
                        ChangeLocalButton(),
                      ],
                    ),
                    Text(
                      "${context.tr(greetingMessage)}, ${user!.name}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              error: (err, _) {
                logger.e(err);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Text(
                    "common.error".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                );
              },
              loading: () => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerContainer(
                          size: const Size(80, 80),
                          borderRadius: BorderRadius.circular(120),
                        ),
                        ChangeLocalButton(),
                      ],
                    ),
                    ShimmerContainer(
                      size: const Size(200, 30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final userSummary = ref.watch(userSummaryProvider);
            return userSummary.when(
              error: (error, stackTrace) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DefaultErrorWidget(
                  backgroundColor: Colors.white,
                ),
              ),
              loading: () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerContainer(
                          size: const Size(150, 30),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        ShimmerContainer(
                          size: const Size(150, 30),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerContainer(
                          size: const Size(150, 30),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        ShimmerContainer(
                          size: const Size(200, 30),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              data: (summary) => Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 8,
                        children: [
                          StatChip(
                            iconData: Icons.quiz_outlined,
                            content:
                                "${"stats.quiz-done".tr()} : ${summary.totalQuizAttempts.toStringAsFixed(0)}",
                          ),
                          StatChip(
                            iconData: Icons.auto_graph_outlined,
                            content:
                                "${"stats.quiz-average-score".tr()} : ${summary.averageQuizScore.toStringAsPrecision(2)}",
                          )
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        spacing: 8,
                        children: [
                          StatChip(
                            color: AppColors.lightBlue,
                            iconData: Icons.task_alt,
                            content:
                                "${"stats.task-done".tr()} : ${summary.totalTaskAttempts.toStringAsFixed(0)}",
                          ),
                          StatChip(
                            color: AppColors.lightBlue,
                            iconData: Icons.auto_graph_rounded,
                            content:
                                "${"stats.task-average-score".tr()} : ${summary.averageTaskScore.toStringAsPrecision(2)}",
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _HomeBodySection extends StatelessWidget {
  const _HomeBodySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_MenuSections(), _ChartsSection(), _ExplorationSection()],
      ),
    );
  }
}

class _MenuSections extends StatelessWidget {
  const _MenuSections();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "common.greeting".tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        MenuCard(),
        Text(
          "menu.self-learn".tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        MenuCard(
          imageAsset: "assets/images/materi-icon.png",
          title: "menu.card.material",
          description: "menu.card.material-description",
        ),
        MenuCard(
          onTap: () => context.push("/examples"),
          imageAsset: "assets/images/conso-icon.png",
          title: "menu.card.examples",
          description: "menu.card.examples-description",
        ),
        Text(
          "menu.evaluation-scoring".tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        QuizMenuCard(),
        TaskMenuCard(),
      ],
    );
  }
}

class _ChartsSection extends StatelessWidget {
  const _ChartsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "menu.learning-progress".tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Consumer(
          builder: (context, ref, child) {
            final submissions =
                ref.watch(submissionListNotifierProvider(limit: 10)).value ??
                    [];
            final taskSubmissions = submissions;
            final quizResultsNotifier =
                ref.watch(quizSubmissionNotifierProvider());
            final results = quizResultsNotifier.data;
            return Column(
              children: [
                QuizChart(
                  quizData: results.isEmpty
                      ? []
                      : List.generate(
                          10,
                          (i) {
                            final reversedResults = results.reversed.toList();
                            return FlSpot(
                              i.toDouble() + 1,
                              i < reversedResults.length
                                  ? reversedResults[i].grade.toDouble()
                                  : 0,
                            );
                          },
                        ),
                ),
                TaskChart(
                  taskData: submissions.isEmpty
                      ? []
                      : List.generate(
                          10,
                          (i) {
                            final reversedResults =
                                taskSubmissions.reversed.toList();
                            return FlSpot(
                              i.toDouble() + 1,
                              i < reversedResults.length
                                  ? reversedResults[i].score?.toDouble() ?? 0
                                  : 0,
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ExplorationSection extends StatelessWidget {
  const _ExplorationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "menu.new-exploration".tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Consumer(
          builder: (context, ref, child) {
            final explorations = ref.watch(explorationListProvider(limit: 5));
            return explorations.when(
              data: (explorations) => ListView.separated(
                  itemCount: explorations.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final exploration = explorations[index];
                    return ExplorationCard(exploration: exploration);
                  }),
              error: (_, __) => DefaultErrorWidget(),
              loading: () => Column(
                spacing: 8,
                children: List.generate(
                  5,
                  (index) => ShimmerContainer(
                    size: const Size(double.maxFinite, 50),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
