import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppChart extends StatelessWidget {
  final List<FlSpot> spots;
  final Color lineColor;

  const AppChart({
    super.key,
    required this.spots,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: LineChart(
        LineChartData(
          maxX: spots.isNotEmpty ? spots.last.x : 10,
          maxY: 110,
          minX: spots.isNotEmpty ? spots.first.x : 1,
          minY: -10,
          showingTooltipIndicators: const [],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              fitInsideHorizontally: false,
              fitInsideVertically: false,
            ),
            handleBuiltInTouches: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              barWidth: 2,
              isCurved: false,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    lineColor.withValues(alpha: 0.6),
                    lineColor.withValues(alpha: 0.5),
                    lineColor.withValues(alpha: 0.4),
                    lineColor.withValues(alpha: 0.3),
                    lineColor.withValues(alpha: 0.2),
                    lineColor.withValues(alpha: 0.1),
                    lineColor.withValues(alpha: 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              color: lineColor,
            )
          ],
          clipData: FlClipData.all(),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                  reservedSize: 5,
                  showTitles: true,
                  getTitlesWidget: (value, meta) => Text("")),
              axisNameWidget: const SizedBox.shrink(),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                reservedSize: 25,
                maxIncluded: false,
                minIncluded: false,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                    ),
                    child: Text(
                      value.toInt().toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            horizontalInterval: 20,
            drawVerticalLine: false,
            checkToShowHorizontalLine: (value) {
              return value % 20 == 0;
            },
          ),
        ),
        curve: Curves.easeIn,
      ),
    );
  }
}
