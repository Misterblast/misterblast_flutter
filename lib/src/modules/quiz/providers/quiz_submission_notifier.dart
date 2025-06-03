import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/modules/quiz/data/quiz_repository.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_submission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_submission_notifier.g.dart';
part 'quiz_submission_notifier.freezed.dart';

@freezed
abstract class QuizSubmissionListPaginationState
    with _$QuizSubmissionListPaginationState {
  const factory QuizSubmissionListPaginationState({
    @Default(1) int page,
    @Default(0) int total,
    @Default(null) int? subjectId,
    @Default([]) List<QuizSubmission> data,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isFetchingMore,
    @Default(false) bool isError,
    @Default('') String errorMessage,
  }) = _QuizSubmissionListPaginationState;
}

@riverpod
class QuizSubmissionNotifier extends _$QuizSubmissionNotifier {
  @override
  QuizSubmissionListPaginationState build({int? subjectId}) {
    fetchQuizSubmissions(subjectId: subjectId);
    return QuizSubmissionListPaginationState(
      isInitialLoading: true,
      subjectId: subjectId,
    );
  }

  fetchQuizSubmissions({int? subjectId}) async {
    final quizRepository = await ref.watch(quizRepositoryProvider.future);
    state = state.copyWith(isInitialLoading: true);
    try {
      final result = await quizRepository.fetchQuizSubmissions(
        page: 1,
        subjectId: subjectId,
      );
      state = state.copyWith(
        page: 1,
        total: result.total,
        data: result.data,
        isInitialLoading: false,
        isFetchingMore: false,
        subjectId: subjectId,
      );
    } catch (e) {
      state = state.copyWith(
        isError: true,
        isInitialLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchMoreQuizSubmissions() async {
    if (state.isFetchingMore || state.page * 10 >= state.total) return;
    if (state.isFetchingMore) return;
    final quizRepository = await ref.watch(quizRepositoryProvider.future);
    state = state.copyWith(isFetchingMore: true);

    try {
      final result = await quizRepository.fetchQuizSubmissions(
        page: state.page + 1,
        subjectId: state.subjectId,
      );
      state = state.copyWith(
        page: state.page + 1,
        total: result.total,
        data: [...state.data, ...result.data],
        isFetchingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        isError: true,
        isFetchingMore: false,
        errorMessage: e.toString(),
      );
    }
  }
}
