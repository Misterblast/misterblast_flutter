import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/modules/examples/data/example_repository.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'seach_question_notifier.g.dart';
part 'seach_question_notifier.freezed.dart';

@freezed
abstract class SearchQuestionFilter with _$SearchQuestionFilter {
  const factory SearchQuestionFilter({
    String? search,
    String? className,
    String? subjectName,
    String? subjectCode,
  }) = _SearchQuestionFilter;
}

@freezed
abstract class SearchQuestionState with _$SearchQuestionState {
  const factory SearchQuestionState({
    @Default(1) int page,
    @Default(0) int total,
    SearchQuestionFilter? filter,
    @Default([]) List<Question> questions,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isFetchingMore,
    @Default(false) bool isError,
    @Default('') String errorMessage,
  }) = _SearchQuestionState;
}

@riverpod
class SearchQuestionNotifier extends _$SearchQuestionNotifier {
  @override
  SearchQuestionState build({
    String? search,
    String? className,
    String? subjectName,
    String? subjectCode,
  }) {
    fetchQuestions(
      search: search,
      className: className,
      subjectName: subjectName,
      subjectCode: subjectCode,
    );
    return const SearchQuestionState(isInitialLoading: true);
  }

  Future<void> fetchQuestions({
    String? search,
    String? className,
    String? subjectName,
    String? subjectCode,
  }) async {
    final exampleRepository = await ref.watch(exampleRepositoryProvider.future);
    state = state.copyWith(
      errorMessage: '',
      isError: false,
      isFetchingMore: false,
      isInitialLoading: true,
      filter: SearchQuestionFilter(
        search: search,
        className: className,
        subjectName: subjectName,
        subjectCode: subjectCode,
      ),
    );
    try {
      final result = await exampleRepository.searchQuestions(
        search: search,
        className: className,
        subjectName: subjectName,
        subjectCode: subjectCode,
        page: state.page,
      );

      state = state.copyWith(
        questions: [...state.questions, ...result.data],
        total: result.total,
        isInitialLoading: false,
        isFetchingMore: false,
        page: state.page,
        filter: state.filter,
      );
    } catch (e) {
      state = state.copyWith(
        isError: true,
        isInitialLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchMoreQuestions() async {
    final exampleRepository = await ref.watch(exampleRepositoryProvider.future);
    if (state.isFetchingMore || state.page * 10 >= state.total) return;
    state = state.copyWith(isFetchingMore: true);
    try {
      final result = await exampleRepository.searchQuestions(
        search: state.filter?.search,
        className: state.filter?.className,
        subjectName: state.filter?.subjectName,
        subjectCode: state.filter?.subjectCode,
        page: state.page + 1,
      );

      state = state.copyWith(
        questions: [...state.questions, ...result.data],
        total: result.total,
        page: state.page + 1,
        isFetchingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        isFetchingMore: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }
}
