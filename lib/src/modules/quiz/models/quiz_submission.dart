// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_submission.g.dart';
part 'quiz_submission.freezed.dart';

@freezed
abstract class QuizSubmission with _$QuizSubmission {
  const factory QuizSubmission({
    required int id,
    required int correct,
    required int grade,
    required String lesson,
    @JsonKey(name: 'set_id') int? setId,
    @JsonKey(name: 'submitted_at') String? submittedAt,
  }) = _QuizSubmission;

  factory QuizSubmission.fromJson(Map<String, dynamic> json) =>
      _$QuizSubmissionFromJson(json);
}
