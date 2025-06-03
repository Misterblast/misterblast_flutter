import 'package:misterblast_flutter/src/modules/quiz/data/quiz_repository.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_explanation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_result_notifier.g.dart';

@riverpod
class QuizResultNotifier extends _$QuizResultNotifier {
  @override
  AsyncValue<QuizExplanation?> build(int? resultId) {
    if (resultId != null) fetchResult(resultId);
    return const AsyncValue.loading();
  }

  fetchResult(int resultId) async {
    state = const AsyncValue.loading();
    try {
      final repo = await ref.read(quizRepositoryProvider.future);
      final explanation = await repo.fetchQuizResult(resultId);
      state = AsyncValue.data(explanation);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
