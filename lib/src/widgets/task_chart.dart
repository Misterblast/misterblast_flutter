import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/app_chart.dart';

class TaskChart extends StatelessWidget {
  const TaskChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
                backgroundColor: AppColors.primary,
                backgroundImage: const AssetImage(
                  "assets/images/tugas-icon.png",
                ),
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "task.title".tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "task.at-last-ten-task".tr(),
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
          AppChart(
            lineColor: AppColors.primary,
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
          )
        ],
      ),
    );
  }
}
