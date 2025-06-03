import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer_explanation.dart';

part 'quiz_explanation.g.dart';
part 'quiz_explanation.freezed.dart';

@freezed
abstract class QuizExplanation with _$QuizExplanation {
  const factory QuizExplanation({
    required int id,
    required String grade,
    required int correct,
    required int wrong,
    required String lesson,
    @JsonKey(name: "attempt_no") required int attemptNo,
    @JsonKey(name: "submitted_at") required int submittedAt,
    required List<QuizAnswerExplanation> answers,
  }) = _QuizExplanation;

  factory QuizExplanation.fromJson(Map<String, dynamic> json) =>
      _$QuizExplanationFromJson(json);
}
