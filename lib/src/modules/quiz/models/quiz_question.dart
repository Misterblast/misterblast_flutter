import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer.dart';

part 'quiz_question.g.dart';
part 'quiz_question.freezed.dart';

@freezed
abstract class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required int id,
    required int number,
    required String type,
    required String content,
    List<QuizAnswer>? answers,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}
