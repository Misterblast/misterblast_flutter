import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/widgets/app_chart.dart';

import '../themes/theme.dart';

class QuizChart extends StatelessWidget {
  const QuizChart({
    super.key,
    required this.quizData,
    this.showSeeAllButton = false,
  });

  final List<FlSpot> quizData;
  final bool? showSeeAllButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.coolTeal,
                backgroundImage: const AssetImage(
                  "assets/images/quiz-icon.png",
                ),
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "quiz.title".tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warmOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "quiz.at-last-ten-quiz".tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: AppFontSizes.sm * 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                ],
              ),
            ],
          ),
          if (quizData.isEmpty)
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                Image.asset(
                  "assets/images/empty-quiz.png",
                  height: 200,
                ),
                Text(
                  "quiz.quiz-no-works".tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: AppFontSizes.sm * 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            )
          else
            AppChart(
              lineColor: AppColors.coolTeal,
              spots: quizData,
            ),
          if (showSeeAllButton == true)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: Text(
                  "${"quiz.show-all-works".tr()} >",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.coolTeal,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
