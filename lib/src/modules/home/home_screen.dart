import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/menu_card.dart';
import 'package:misterblast_flutter/src/widgets/quiz_chart.dart';
import 'package:misterblast_flutter/src/widgets/quiz_menu_card.dart';
import 'package:misterblast_flutter/src/widgets/stat_chip.dart';
import 'package:misterblast_flutter/src/widgets/task_chart.dart';
import 'package:misterblast_flutter/src/widgets/task_menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String greetingMessage = "common.good-morning".tr();

    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      greetingMessage = "common.good-morning".tr();
    } else if (hour >= 12 && hour < 17) {
      greetingMessage = "common.good-afternoon".tr();
    } else if (hour >= 17 && hour < 19) {
      greetingMessage = "common.good-evening".tr();
    } else {
      greetingMessage = "common.good-night".tr();
    }

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
                children: [
                  Padding(
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
                                "https://picsum.photos/id/237/200/300",
                              ),
                            ),
                            ChangeLocalButton(),
                          ],
                        ),
                        Text(
                          "$greetingMessage, Eka Robyanto",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Column(
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
                                content: "${"stats.quiz-done".tr()} : 90",
                              ),
                              StatChip(
                                iconData: Icons.auto_graph_outlined,
                                content:
                                    "${"stats.quiz-average-score".tr()} : 90",
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
                                content: "${"stats.task-done".tr()} : 90",
                              ),
                              StatChip(
                                color: AppColors.lightBlue,
                                iconData: Icons.auto_graph_rounded,
                                content:
                                    "${"stats.task-average-score".tr()} : 90",
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
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
                            Text(
                              "menu.learning-progress".tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            QuizChart(quizData: []),
                            TaskChart(taskData: []),
                            Text(
                              "menu.new-exploration".tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            ListView.separated(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) => ListTile(
                                contentPadding: const EdgeInsets.all(8),
                                leading: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundColor: AppColors.lightBlue,
                                  onBackgroundImageError:
                                      (exception, stackTrace) =>
                                          const Icon(Icons.error),
                                  backgroundImage: NetworkImage(
                                    "https://picsum.photos/id/237/200/300",
                                  ),
                                ),
                                title: Text(
                                  "exploration $index",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                subtitle: Text(
                                  "menu.card.material-description $index",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey),
                                ),
                                titleAlignment: ListTileTitleAlignment.top,
                                trailing: Text(
                                  "12-12-2023",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                tileColor: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
