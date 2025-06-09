import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_submission.g.dart';
part 'task_submission.freezed.dart';

@freezed
abstract class TaskSubmission with _$TaskSubmission {
  const factory TaskSubmission({
    required int id,
    required String title,
    required String description,
    required String content,
    @JsonKey(name: "submitted_at") required String submittedAt,
    @JsonKey(name: "scored_at") String? scoredAt,
    String? feedback,
    int? score,
  }) = _TaskSubmission;

  factory TaskSubmission.fromJson(Map<String, dynamic> json) =>
      _$TaskSubmissionFromJson(json);
}

  // {
  //         "id": 3,
  //         "title": "task 3",
  //         "description": "description task 3",
  //         "content": "content task 3",
  //         "score": null,
  //         "scored_at": null,
  //         "submitted_at": "1749438716",
  //         "feedback": null
  //       },
