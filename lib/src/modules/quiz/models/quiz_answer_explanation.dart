import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer_explanation.g.dart';
part 'quiz_answer_explanation.freezed.dart';

@freezed
abstract class QuizAnswerExplanation with _$QuizAnswerExplanation {
  const factory QuizAnswerExplanation({
    required int number,
    @Default("-") @JsonKey(name: "user_code") String userCode,
    @Default("-") @JsonKey(name: "actual_code") String actualCode,
    @Default("-") @JsonKey(name: "user_content") String userContent,
    @Default("-") @JsonKey(name: "actual_content") String actualContent,
    @Default("-") @JsonKey(name: "question_content") String questionContent,
    @Default(false) @JsonKey(name: "is_correct") bool isCorrect,
    @Default("-") String explanation,
    @Default("-") String reason,
    @Default("-") @JsonKey(name: "Format") String format,
  }) = _QuizAnswerExplanation;

  factory QuizAnswerExplanation.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerExplanationFromJson(json);
}
