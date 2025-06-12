import 'package:misterblast_flutter/src/modules/task/models/task_submission.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission_list_notifier.g.dart';

@riverpod
class SubmissionListNotifier extends _$SubmissionListNotifier {
  @override
  AsyncValue<List<TaskSubmission>> build({int? limit}) {
    fetchSubmissions(limit);
    return const AsyncValue.loading();
  }

  fetchSubmissions(int? limit) async {
    final repo = await ref.watch(taskRepositoryProvider.future);
    state = const AsyncValue.loading();
    try {
      final submissions = await repo.fetchSubmissions(limit: limit ?? 3);
      state = AsyncValue.data(submissions.data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
