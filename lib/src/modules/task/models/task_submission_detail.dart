import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_submission_detail.g.dart';
part 'task_submission_detail.freezed.dart';

@freezed
abstract class TaskSubmissionDetail with _$TaskSubmissionDetail {
  const factory TaskSubmissionDetail({
    required int id,
    required String title,
    required String description,
    required String content,
    @JsonKey(name: "scored_at") String? scoredAt,
    @JsonKey(name: "submitted_at") String? submittedAt,
    @JsonKey(name: "task_attachment_url") String? taskAttachmentUrl,
    @JsonKey(name: "answer_attachment_url") String? answerAttachmentUrl,
    double? score,
    String? feedback,
    String? answer,
  }) = _TaskSubmissionDetail;

  factory TaskSubmissionDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskSubmissionDetailFromJson(json);
}
