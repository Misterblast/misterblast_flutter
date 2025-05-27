import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        context.tr("question-types.${question.type}"),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withAlpha(50),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        context.tr("question-answer-types.${question.format}"),
                        textAlign: TextAlign.end,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                dense: true,
                initiallyExpanded: true,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                title: Text(
                  context.tr("common.reason"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  AppMarkdownViewer(content: question.reason),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr("common.question"),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    AppMarkdownViewer(content: question.content),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     spacing: 8,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         context.tr("common.answer"),
              //         style:
              //             Theme.of(context).textTheme.headlineSmall!.copyWith(
              //                   color: Theme.of(context).colorScheme.primary,
              //                 ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: (question.answers ?? [])
              //             .map(
              //               (answer) => Padding(
              //                 padding: const EdgeInsets.only(bottom: 8.0),
              //                 child: AppMarkdownViewer(content: answer.content),
              //               ),
              //             )
              //             .toList(),
              //       ),
              //     ],
              //   ),
              // ),
              ExpansionTile(
                dense: true,
                initiallyExpanded: true,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                title: Text(
                  context.tr("common.explanation"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  AppMarkdownViewer(content: question.explanation),
                ],
              ),
            ],
          ),
        ));
  }
}
