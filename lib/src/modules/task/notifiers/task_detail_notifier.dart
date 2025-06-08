import 'package:misterblast_flutter/src/modules/task/models/task.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_detail_notifier.g.dart';

@riverpod
class TaskDetailNotifier extends _$TaskDetailNotifier {
  @override
  AsyncValue<TaskDetail> build(int taskId) {
    fetchTaskDetail(taskId);
    return const AsyncLoading();
  }

  fetchTaskDetail(int taskId) async {
    final repo = await ref.watch(taskRepositoryProvider.future);
    state = AsyncLoading();
    try {
      final taskDetail = await repo.fetchTaskDetail(taskId);
      state = AsyncData(taskDetail);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
