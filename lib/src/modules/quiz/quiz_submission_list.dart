import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/models/class.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_submission.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/select_subject_sheet.dart';

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
                      (Lesson?, Class?) tuple = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SelectSubjectSheet(
                          showClass: false,
                        ),
                      );
                      setState(() {
                        _filterSubject = tuple.$1;
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
                  spacing: 16,
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
                              context.tr("subjects.${_filterSubject!}"),
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, _) => QuizSubmissionCard(
                          submission: QuizSubmission(
                            id: "1",
                            setId: "1",
                            name: "Quiz Submission 1",
                            correct: 5,
                            grade: 80,
                            lesson: "mathematics",
                            className: "1",
                            submittedAt: DateTime.now().millisecondsSinceEpoch,
                          ),
                        ),
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

class QuizSubmissionCard extends StatelessWidget {
  const QuizSubmissionCard({super.key, required this.submission});

  final QuizSubmission submission;
  static List<Map<String, dynamic>> subjects = [
    {"icon": "math-icon.png", "title": "mathematics"},
    {"icon": "pancasila-icon.png", "title": "civics"},
    {"icon": "bindo-icon.png", "title": "indonesian"},
    {"icon": "ipas-icon.png", "title": "science"},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => context.push('/quiz/result-detail/${submission.id}'),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          backgroundImage: AssetImage(
            "assets/images/${subjects.firstWhere((element) => element['title'] == submission.lesson)['icon']}",
          ),
        ),
        title: Text(
          "${context.tr("common.class")} ${submission.className} ${context.tr("subjects.${submission.lesson}")}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        subtitle: Text(
          "${context.tr("common.date")} : ${parseUnixDatetime(submission.submittedAt, locale: context.locale.countryCode)}",
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
