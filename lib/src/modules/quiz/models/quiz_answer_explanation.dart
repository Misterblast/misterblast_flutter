import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer_explanation.g.dart';
part 'quiz_answer_explanation.freezed.dart';

@freezed
abstract class QuizAnswerExplanation with _$QuizAnswerExplanation {
  const factory QuizAnswerExplanation({
    required int number,
    @JsonKey(name: "user_code") required String userCode,
    @JsonKey(name: "actual_code") required String actualCode,
    @JsonKey(name: "user_content") required String userContent,
    @JsonKey(name: "actual_content") required String actualContent,
    @JsonKey(name: "question_content") required String questionContent,
    @JsonKey(name: "is_correct") required bool isCorrect,
    required String explanation,
    required String reason,
    @JsonKey(name: "Format") required String format,
  }) = _QuizAnswerExplanation;

  factory QuizAnswerExplanation.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerExplanationFromJson(json);
}
