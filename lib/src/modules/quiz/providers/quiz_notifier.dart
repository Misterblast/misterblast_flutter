import 'package:misterblast_flutter/src/modules/quiz/data/quiz_repository.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_notifier.g.dart';

@riverpod
class QuizNotifier extends _$QuizNotifier {
  @override
  AsyncValue<List<QuizQuestion>> build() {
    return AsyncValue.data([]);
  }

  void fetchQuiz(int subjectId) async {
    final repository = await ref.watch(quizRepositoryProvider.future);
    state = const AsyncValue.loading();
    try {
      await repository.fetchQuiz(subjectId).then((value) {
        state = AsyncValue.data(value);
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
