import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/task/models/task_submission.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';

class TaskSubmissionTile extends StatelessWidget {
  const TaskSubmissionTile({super.key, required this.taskSubmission});
  final TaskSubmission taskSubmission;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scored = taskSubmission.score != null;
    final textColor = scored
        ? AppColors.coolTeal
        : AppColors.warmOrange; // Use colors based on score status
    return Material(
      type: MaterialType.transparency,
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            maxRadius: 16,
            backgroundColor: scored ? AppColors.coolTeal : AppColors.warmOrange,
            child: Icon(
              scored ? Icons.check : Icons.timelapse_sharp,
              color: Colors.white,
            ),
          ),
          title: Text(
            taskSubmission.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: scored
                        ? AppColors.coolTeal.withAlpha(25)
                        : AppColors.warmOrange.withAlpha(25),
                    borderRadius: BorderRadius.circular(64),
                  ),
                  child: Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        scored
                            ? context.tr("task.scored-at")
                            : context.tr("quiz-result.submitted-at"),
                        style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                      Text(
                        ":",
                        style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                      Text(
                        parseUnixDatetime(
                              int.parse(
                                taskSubmission.scoredAt ??
                                    taskSubmission.submittedAt,
                              ),
                            ) ??
                            "",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                      ),
                    ],
                  ),
                ),
                if (taskSubmission.score != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.coolTeal.withAlpha(25),
                      borderRadius: BorderRadius.circular(64),
                    ),
                    child: Row(
                      spacing: 4,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          taskSubmission.score?.toString() ?? "0",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
