import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class QuizMenuCard extends StatelessWidget {
  const QuizMenuCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push("/quiz"),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.coolTeal,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              right: 0,
              child: Image.asset(
                "assets/images/quiz-icon.png",
                scale: 3,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "quiz.title",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.white, fontSize: 20),
                        ).tr(),
                        Text(
                          context.tr("quiz.quiz-description"),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontSize: AppFontSizes.sm + 2,
                                  ),
                        ),
                        const SizedBox(height: 8),
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
                            "quiz.quiz-start".tr(),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      fontSize: AppFontSizes.sm,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: const SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
