import 'package:misterblast_flutter/src/modules/task/notifiers/task_list_notifier.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:misterblast_flutter/src/providers/user_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_task_notifier.g.dart';

@riverpod
class SubmitTaskNotifier extends _$SubmitTaskNotifier {
  @override
  AsyncValue<bool> build() {
    return const AsyncData(false);
  }

  Future<void> submitTask(int taskId, String answer, String? filePath) async {
    final repo = await ref.watch(taskRepositoryProvider.future);
    state = const AsyncLoading();
    try {
      await repo.submitTask(taskId, answer, filePath);
      ref.invalidate(taskListNotifierProvider);
      ref.invalidate(userSummaryProvider);
      state = const AsyncData(true);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
