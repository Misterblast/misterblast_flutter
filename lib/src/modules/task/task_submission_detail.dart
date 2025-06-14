import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/task_submission_detail_notifier.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_link_widget.dart';
import 'package:misterblast_flutter/src/widgets/app_loading.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';
import 'package:misterblast_flutter/src/widgets/default_error_widget.dart';

class TaskSubmissionDetail extends ConsumerWidget {
  const TaskSubmissionDetail({
    super.key,
    required this.submissionId,
  });

  final int submissionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskSubmissionDetail =
        ref.watch(taskSubmissionDetailProvider(submissionId));

    final theme = Theme.of(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
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
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBackButton(
                          backgroundColor: theme.colorScheme.secondary,
                        ),
                        taskSubmissionDetail.maybeWhen(
                          orElse: () => const SizedBox.shrink(),
                          data: (data) => InkWell(
                            onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                      width: double.maxFinite,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          spacing: 16,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              spacing: 8,
                                              children: [
                                                Icon(
                                                  Icons.info_outline,
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                                Text(
                                                  context.tr("task.info"),
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  context.tr("common.title"),
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                                Text(
                                                  data.title,
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  context.tr("common.desc"),
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                                Text(
                                                  data.description,
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  context.tr(
                                                    "common.submitted-at",
                                                  ),
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                                Text(
                                                  parseUnixDatetime(int.parse(
                                                          data.submittedAt ??
                                                              '0')) ??
                                                      "-",
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                            child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: theme.colorScheme.secondary,
                              ),
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: taskSubmissionDetail.when(
                            error: (error, stackTrace) =>
                                Center(child: DefaultErrorWidget()),
                            loading: () => Center(child: AppLoading()),
                            data: (task) {
                              final isScored = task.score != null;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!isScored)
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.warmOrange.withAlpha(20),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Positioned(
                                            bottom: -12,
                                            right: -12,
                                            child: Opacity(
                                              opacity: 0.1,
                                              child: Icon(
                                                Icons.timelapse_sharp,
                                                size: 65,
                                                color: AppColors.warmOrange,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Row(
                                              spacing: 8,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.timelapse_sharp,
                                                  size: 32,
                                                  color: AppColors.warmOrange,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    textAlign: TextAlign.start,
                                                    context.tr(
                                                        "task.submission-not-scored"),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall
                                                        ?.copyWith(
                                                          fontSize: 14,
                                                          color: AppColors
                                                              .warmOrange,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (isScored)
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.darkerGreen.withAlpha(20),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Positioned(
                                            bottom: -12,
                                            right: -12,
                                            child: Opacity(
                                              opacity: 0.1,
                                              child: Icon(
                                                Icons.timelapse_sharp,
                                                size: 65,
                                                color: AppColors.darkerGreen,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Row(
                                              spacing: 8,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.timelapse_sharp,
                                                  size: 32,
                                                  color: AppColors.darkerGreen,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${context.tr("common.score")} : ${task.score}",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .darkerGreen,
                                                            ),
                                                      ),
                                                      RichText(
                                                          text: TextSpan(
                                                        text: "Feedback :",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineSmall
                                                            ?.copyWith(
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .darkerGreen,
                                                            ),
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                " ${task.feedback}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall
                                                                ?.copyWith(
                                                                  color: AppColors
                                                                      .darkerGreen,
                                                                ),
                                                          ),
                                                        ],
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ClipRRect(
                                    clipBehavior: Clip.none,
                                    borderRadius: BorderRadius.circular(24),
                                    child: ExpansionTile(
                                      dense: true,
                                      initiallyExpanded: true,
                                      collapsedIconColor:
                                          Theme.of(context).colorScheme.primary,
                                      tilePadding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      title: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.primary
                                                  .withAlpha(30),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Text(
                                              context.tr("common.question"),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: theme
                                                        .colorScheme.primary,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minWidth: double.maxFinite,
                                            minHeight: 250,
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                          ),
                                          child: Card(
                                            margin: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Scrollbar(
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: AppMarkdownViewer(
                                                    content: task.content,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        if (task.taskAttachmentUrl != null &&
                                            task.taskAttachmentUrl!.isNotEmpty)
                                          AppLinkWidget(
                                              url: task.taskAttachmentUrl!)
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    clipBehavior: Clip.none,
                                    child: ExpansionTile(
                                      dense: true,
                                      initiallyExpanded: true,
                                      expandedCrossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      collapsedIconColor:
                                          Theme.of(context).colorScheme.primary,
                                      tilePadding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      title: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.primary
                                                  .withAlpha(30),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Text(
                                              context.tr("common.answer"),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: theme
                                                        .colorScheme.primary,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      expandedAlignment: Alignment.topLeft,
                                      childrenPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      children: [
                                        Text(
                                          task.answer ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        if (task.answerAttachmentUrl != null &&
                                            task.answerAttachmentUrl!
                                                .isNotEmpty)
                                          AppLinkWidget(
                                              url: task.answerAttachmentUrl!),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
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
