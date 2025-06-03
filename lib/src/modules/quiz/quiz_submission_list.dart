import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/constants/subjects.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_submission.dart';
import 'package:misterblast_flutter/src/modules/quiz/providers/quiz_submission_notifier.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/select_subject_sheet.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class QuizSubmissionList extends StatefulWidget {
  const QuizSubmissionList({super.key});

  @override
  State<QuizSubmissionList> createState() => _QuizSubmissionListState();
}

class _QuizSubmissionListState extends State<QuizSubmissionList> {
  Lesson? _filterSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  ChangeLocalButton()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      context.tr("quiz.works-result"),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Lesson? subject = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SelectSubjectSheet(
                          showClass: false,
                        ),
                      );
                      if (subject == null) return;
                      setState(() {
                        _filterSubject = subject;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        spacing: 6,
                        children: [
                          Icon(
                            size: 16,
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                          Text(
                            "Filter",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 3,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        if (_filterSubject != null)
                          Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label: Text(
                              context.tr("subjects.${_filterSubject!.code}"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            deleteIcon: Icon(Icons.close, color: Colors.white),
                            onDeleted: () {
                              setState(() {
                                _filterSubject = null;
                              });
                            },
                          ),
                      ],
                    ),
                    QuizSubmissionListWidget(subjectId: _filterSubject?.id),
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

class QuizSubmissionListWidget extends ConsumerStatefulWidget {
  const QuizSubmissionListWidget({super.key, this.subjectId});

  final int? subjectId;

  @override
  ConsumerState<QuizSubmissionListWidget> createState() =>
      _QuizSubmissionListWidgetState();
}

class _QuizSubmissionListWidgetState
    extends ConsumerState<QuizSubmissionListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    ref.listenManual(
      quizSubmissionNotifierProvider(subjectId: widget.subjectId),
      (_, state) {
        if (state.data.isNotEmpty) {
          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                    _scrollController.position.maxScrollExtent ||
                _scrollController.position.maxScrollExtent == 0) {
              ref
                  .read(quizSubmissionNotifierProvider(
                    subjectId: widget.subjectId,
                  ).notifier)
                  .fetchMoreQuizSubmissions();
            }
          });
          _maybeFetchIfNotScrollable();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _maybeFetchIfNotScrollable() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (!_scrollController.hasClients) return;

      final position = _scrollController.position;
      final isScrollable = position.maxScrollExtent > 0;

      if (!isScrollable) {
        ref
            .read(quizSubmissionNotifierProvider(
              subjectId: widget.subjectId,
            ).notifier)
            .fetchMoreQuizSubmissions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final submissionNotifier = ref.watch(
            quizSubmissionNotifierProvider(
              subjectId: widget.subjectId,
            ),
          );

          if (submissionNotifier.isInitialLoading) {
            return ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => ShimmerContainer(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                size: const Size(double.infinity, 80),
              ),
            );
          }

          if (submissionNotifier.isError) {
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                context.tr("exceptions.unknown-error"),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          if (submissionNotifier.data.isEmpty) {
            return Column(
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
            );
          }
          if (submissionNotifier.data.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: submissionNotifier.data.length,
                    itemBuilder: (context, idx) => QuizSubmissionCard(
                      submission: submissionNotifier.data[idx],
                    ),
                  ),
                ),
                if (submissionNotifier.isFetchingMore)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
      ),
    );
  }
}

class QuizSubmissionCard extends StatelessWidget {
  const QuizSubmissionCard({super.key, required this.submission});

  final QuizSubmission submission;

  @override
  Widget build(BuildContext context) {
    final subject = AVAILABLE_SUBJECTS.firstWhere(
      (element) => element['title'] == submission.lesson,
      orElse: () => {'title': 'Unknown', 'icon': 'default_icon.png'},
    );
    return Card(
      child: ListTile(
        onTap: () => context.push('/quiz/result-detail/${submission.id}'),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          backgroundImage: AssetImage(
            "assets/images/${subject['icon']}",
          ),
        ),
        title: Text(
          context.tr("subjects.${subject['code']}"),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        subtitle: Text(
          "${context.tr("common.date")} : ${submission.submittedAt != null && submission.submittedAt != "" ? parseUnixDatetime(
              int.parse(submission.submittedAt!),
              locale: context.locale.countryCode,
            ) : "-"}",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Text(
          submission.grade.toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
