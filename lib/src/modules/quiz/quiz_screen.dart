import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/modules/quiz/providers/quiz_notifier.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_chart.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/stat_chip.dart';

import '../../widgets/select_subject_sheet.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  void initState() {
    ref.listenManual(quizNotifierProvider, (_, state) {
      state.when(
        data: (data) => {
          _loadingOverlay.hide(),
          //navigate
        },
        error: (err, trace) => {
          _loadingOverlay.hide(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                context.tr("exceptions.unknown-error"),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        },
        loading: () => _loadingOverlay.show(context),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -60,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset("assets/images/quiz-icon.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    ChangeLocalButton(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.1,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        spacing: 24,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(),
                          Column(
                            spacing: 12,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Icon(
                                    Icons.label_important_sharp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(
                                    context.tr("quiz.do-quiz"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(65),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    return ListTile(
                                      dense: true,
                                      onTap: () async {
                                        final subject =
                                            await showModalBottomSheet<Lesson>(
                                          context: context,
                                          isDismissible: true,
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              SelectSubjectSheet(
                                            showClass: false,
                                          ),
                                        );
                                        if (subject == null) return;
                                        ref
                                            .read(quizNotifierProvider.notifier)
                                            .fetchQuiz(subject.id);
                                      },
                                      style: ListTileStyle.drawer,
                                      tileColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 8,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withAlpha(75),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: Image.asset(
                                          "assets/images/stopwatch.png",
                                        ),
                                      ),
                                      title: Text(
                                        context.tr("quiz.select-subject"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      subtitle: AutoSizeText(
                                        context.tr(
                                          "quiz.select-subject-desc",
                                        ),
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 12,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Icon(
                                    Icons.label_important_sharp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(
                                    context.tr("quiz.works-result"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(65),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: ListTile(
                                  dense: true,
                                  onTap: () => context.push(
                                    '/quiz/submission-list',
                                  ),
                                  style: ListTileStyle.drawer,
                                  tileColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  leading: Icon(
                                    Icons.history,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 40,
                                  ),
                                  title: Text(
                                    context.tr("quiz.show-all-works"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  subtitle: AutoSizeText(
                                    context.tr(
                                      "quiz.show-all-works-desc",
                                    ),
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Icon(
                                    Icons.label_important_sharp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  Text(
                                    context.tr("common.stats"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ],
                              ),
                              Text(
                                context.tr("quiz.graph-description"),
                              ),
                              AppChart(
                                lineColor: AppColors.coolTeal,
                                spots: [
                                  FlSpot(1, 20),
                                  FlSpot(2, 40),
                                  FlSpot(3, 60),
                                  FlSpot(4, 80),
                                  FlSpot(5, 100),
                                  FlSpot(6, 90),
                                  FlSpot(7, 70),
                                  FlSpot(8, 50),
                                  FlSpot(9, 30),
                                  FlSpot(10, 20), // Example data points
                                ],
                              ),
                              Wrap(
                                spacing: 3,
                                runSpacing: 6,
                                children: [
                                  StatChip(
                                    iconData: Icons.drafts,
                                    content:
                                        "${context.tr("stats.quiz-done")}  : 10",
                                  ),
                                  StatChip(
                                    iconData: Icons.local_fire_department_sharp,
                                    content:
                                        "${context.tr("stats.quiz-highest-score")} : 100",
                                  ),
                                  StatChip(
                                    iconData: Icons.align_vertical_bottom,
                                    content:
                                        "${context.tr("stats.quiz-average-score")}  : 100",
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
