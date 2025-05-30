import 'package:misterblast_flutter/src/modules/quiz/models/quiz_explanation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_result_notifier.g.dart';

@riverpod
class QuizResultNotifier extends _$QuizResultNotifier {
  @override
  AsyncValue<QuizExplanation> build() {
    return const AsyncValue.loading();
  }

  Future<void> fetchQuizResult(int quizId) async {
    state = const AsyncValue.loading();
    try {
      // state = const AsyncValue.data();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
