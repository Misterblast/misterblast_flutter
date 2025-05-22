import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_submission.g.dart';
part 'quiz_submission.freezed.dart';

@freezed
abstract class QuizSubmission with _$QuizSubmission {
  const factory QuizSubmission({
    required String id,
    @JsonKey(name: 'set_id') required String setId,
    required String name,
    required int correct,
    required int grade,
    required String lesson,
    @JsonKey(name: 'class') required String className,
    @JsonKey(name: 'submitted_at') required int submittedAt,
  }) = _QuizSubmission;

  factory QuizSubmission.fromJson(Map<String, dynamic> json) =>
      _$QuizSubmissionFromJson(json);
}
