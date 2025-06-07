import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/models/paginated_response.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/task.dart';

part 'task_list_notifier.g.dart';
part 'task_list_notifier.freezed.dart';

@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState({
    @Default(1) int page,
    @Default(0) int total,
    @Default("") String search,
    @Default([]) List<Task> tasks,
    @Default('') String errorMessage,
    @Default(false) bool isError,
    @Default(false) bool isFetchingMore,
    @Default(false) bool isInitialLoading,
  }) = _TaskListState;
}

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  @override
  TaskListState build({int? page = 1, int? limit = 10}) {
    fetchTask(page: page, limit: limit);
    return const TaskListState(isInitialLoading: true);
  }

  void fetchTask({int? page = 1, int? limit = 10, String? search}) async {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    final repo = await ref.watch(taskRepositoryProvider.future);
    state = state.copyWith(
      isError: false,
      isInitialLoading: true,
      search: search ?? '',
    );
    try {
      final PaginatedResponse<Task> response =
          await repo.fetchTasks(page: page, limit: limit, search: search);
      state = state.copyWith(
        isError: false,
        isInitialLoading: false,
        page: response.page,
        total: response.total,
        tasks: response.data,
      );
    } catch (e) {
      state = state.copyWith(
        isError: true,
        isInitialLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchMoreTask({int? limit = 10}) async {
    if (state.isFetchingMore || state.isInitialLoading) return;

    final nextPage = state.page + 1;
    final totalPages = (state.total / limit!).ceil();

    if (nextPage > totalPages) return;

    state = state.copyWith(isFetchingMore: true);
    final repo = await ref.watch(taskRepositoryProvider.future);

    try {
      final PaginatedResponse<Task> response = await repo.fetchTasks(
        page: nextPage,
        limit: limit,
        search: state.search,
      );

      state = state.copyWith(
        isFetchingMore: false,
        page: response.page,
        total: response.total,
        tasks: [...state.tasks, ...response.data],
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
