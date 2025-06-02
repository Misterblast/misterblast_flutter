import 'package:misterblast_flutter/src/modules/quiz/data/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_quiz_notifier.g.dart';

@riverpod
class SubmitQuizNotifier extends _$SubmitQuizNotifier {
  @override
  AsyncValue<int?> build() {
    return const AsyncValue.data(null);
  }

  submitQuiz({
    required int subjectId,
    required List<Map<String, dynamic>> answers,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = await ref.watch(quizRepositoryProvider.future);
      final submissionId = await repo.submitQuiz(subjectId, answers);
      state = AsyncValue.data(submissionId);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
