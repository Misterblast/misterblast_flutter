import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_question.dart';
import 'package:misterblast_flutter/src/modules/quiz/providers/submit_quiz_notifier.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/quiz_display.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/quiz_navigation_sheet.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/linear_timer.dart';

class OnQuizScreen extends ConsumerStatefulWidget {
  const OnQuizScreen({
    super.key,
    required this.subject,
    required this.questionSet,
    required this.quizQuestions,
  });
  final int questionSet;
  final Lesson subject;
  final List<QuizQuestion> quizQuestions;
  // final String className;

  @override
  ConsumerState<OnQuizScreen> createState() => _OnQuizScreenState();
}

class _OnQuizScreenState extends ConsumerState<OnQuizScreen>
    with TickerProviderStateMixin {
  bool showSubmitButton = false;
  bool showBackButton = false;
  Map<String, dynamic> selectedAnswer = {};
  final PageController _pageController = PageController();
  final GlobalKey<LinearTimerState> _timerKey = GlobalKey();

  late List<QuizQuestion> questions;
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  void initState() {
    questions = widget.quizQuestions;
    selectedAnswer = {
      for (var question in questions) question.number.toString(): null
    };
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(() {
        if (_pageController.page == 0) {
          setState(() {
            showBackButton = false;
          });
        } else {
          setState(() {
            showBackButton = true;
          });
        }

        if (_pageController.page == questions.length - 1) {
          setState(() {
            showSubmitButton = true;
          });
        } else {
          setState(() {
            showSubmitButton = false;
          });
        }
      });
    });

    ref.listenManual(submitQuizNotifierProvider, (_, state) {
      state.when(
        data: (id) {
          _loadingOverlay.hide();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(context.tr("quiz.submit-success")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/home_decor.png"),
                      Image.asset(
                        "assets/images/celebrate.png",
                        width: 225,
                      ),
                    ],
                  ),
                  Text(
                    context.tr("quiz.submit-success-desc"),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actionsOverflowButtonSpacing: 8,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    context.pushReplacement("/quiz/result-detail/$id");
                  },
                  child: Text(context.tr("quiz.see-result")),
                ),
              ],
            ),
          );
        },
        error: (err, trace) {
          _loadingOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr("exceptions.unknown-error")),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
        loading: () => _loadingOverlay.show(context),
      );
    });
    super.initState();
  }

  onSelect(String code) => setState(
        () => selectedAnswer[
            questions[_pageController.page!.toInt()].number.toString()] = code,
      );

  onTimerOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(context.tr("quiz.timeout")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/alert.png",
                  width: 225,
                ),
                Image.asset(
                  "assets/images/stopwatch.png",
                  width: 125,
                ),
              ],
            ),
            Text(
              context.tr("quiz.timeout-desc"),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actionsOverflowButtonSpacing: 8,
        actions: [
          ElevatedButton(
            onPressed: () {
              context.pop();
              context.pushReplacement("/quiz/result-detail/1");
            },
            child: Text(context.tr("quiz.see-result")),
          ),
        ],
      ),
    );
    // submitQuiz();
  }

  onPreviousQuestion() => _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

  onNextQuestion() => _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

  onSubmit() {
    String confirmationMessage = "quiz.submit-confirm-desc";
    List<String?> selectedAnswerList =
        selectedAnswer.entries.map((e) => e.value as String?).toList();
    if (selectedAnswerList.contains(null)) {
      confirmationMessage = "quiz.submit-confirm-empty-answer-desc";
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(context.tr("quiz.submit-confirm")),
        content: Text(context.tr(confirmationMessage)),
        actionsOverflowButtonSpacing: 8,
        actions: [
          ElevatedButton(
            onPressed: () {
              context.pop();
              submitQuiz();
            },
            child: Text(context.tr("common.submit")),
          ),
          OutlinedButton(
            onPressed: () => context.pop(),
            child: Text(context.tr("common.back")),
          ),
        ],
      ),
    );
  }

  submitQuiz() => ref.read(submitQuizNotifierProvider.notifier).submitQuiz(
      subjectId: widget.questionSet,
      answers: selectedAnswer.entries.map((entry) {
        return {
          "number": int.parse(entry.key),
          "answer": entry.value ?? "x",
        };
      }).toList());

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget renderFooterButton() {
    if (showSubmitButton) {
      return Row(
        spacing: 8,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPreviousQuestion,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left_rounded),
                  Text(
                    context.tr("common.back"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.tr("common.submit")),
                  Icon(Icons.done_all_rounded),
                ],
              ),
            ),
          ),
        ],
      );
    }

    if (showBackButton) {
      return Row(
        spacing: 8,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPreviousQuestion,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left_rounded),
                  Text(context.tr("common.back")),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: onNextQuestion,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.tr("common.next")),
                  Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return ElevatedButton(
      onPressed: onNextQuestion,
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.tr("common.next")),
          Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GptMarkdownTheme(
      gptThemeData: GptMarkdownTheme.of(context).copyWith(
        highlightColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBackButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: AutoSizeText(
            maxLines: 1,
            // "${context.tr("subjects.${widget.subject}")} ${context.tr(widget.className)}",
            context.tr("subjects.${widget.subject.code}"),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          actions: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => QuizNavigationSheet(
                  currentIndex: _pageController.hasClients
                      ? _pageController.page!.toInt()
                      : 0,
                  selectedAnswer: selectedAnswer,
                  onSelect: (index) {
                    context.pop();
                    _pageController.jumpToPage(index);
                  },
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              spacing: 16,
              children: [
                Column(
                  spacing: 4,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          "${_pageController.hasClients ? _pageController.page!.toInt() + 1 : 1}/${questions.length}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double progress = 0.0;
                              if (_pageController.hasClients &&
                                  _pageController.page != null) {
                                progress = _pageController.page! /
                                    (questions.length - 1);
                              }
                              return LinearProgressIndicator(
                                minHeight: 16,
                                value: progress.clamp(0.0, 1.0),
                                borderRadius: BorderRadius.circular(20),
                                backgroundColor: Colors.grey.withAlpha(20),
                                color: Theme.of(context).colorScheme.primary,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Expanded(
                          child: LinearTimer(
                            key: _timerKey,
                            duration: 300,
                            onTimerComplete: onTimerOut,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: questions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => QuizDisplay(
                      question: questions[index],
                      selectedAnswer:
                          selectedAnswer[questions[index].number.toString()],
                      onSelect: (String? value) {
                        onSelect(value!);
                      },
                    ),
                  ),
                ),
                PageTransitionSwitcher(
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) =>
                          SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: renderFooterButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
