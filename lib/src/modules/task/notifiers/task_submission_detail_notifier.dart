import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/modules/task/models/task_submission_detail.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_submission_detail_notifier.g.dart';

@riverpod
Future<TaskSubmissionDetail> taskSubmissionDetail(
  Ref ref,
  int submissionId,
) async {
  final repo = await ref.watch(taskRepositoryProvider.future);
  return repo.fetchTaskSubmissionDetail(submissionId);
}
