import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/quiz_chart.dart';
import 'package:misterblast_flutter/src/widgets/quiz_menu_card.dart';
import 'package:misterblast_flutter/src/widgets/task_chart.dart';
import 'package:misterblast_flutter/src/widgets/task_menu_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  double _rowOpacity = 1.0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity = 1.0 - (offset / 50);
      if (newOpacity < 0.0) newOpacity = 0.0;
      if (newOpacity > 1.0) newOpacity = 1.0;

      setState(() {
        _rowOpacity = newOpacity;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _rowOpacity,
              alwaysIncludeSemantics: true,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Icon(
                      Icons.add_task_outlined,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: ChangeLocalButton(),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              hitTestBehavior: HitTestBehavior.translucent,
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr('bottombar.activity'),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          QuizMenuCard(),
                          TaskMenuCard(),
                          Text(
                            context.tr('activity.your-growth'),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          QuizChart(quizData: []),
                          TaskChart(taskData: []),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
