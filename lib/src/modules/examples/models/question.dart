import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer.dart';

part 'question.g.dart';
part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required int id,
    required int number,
    required String type,
    required String format,
    required String content,
    required String explanation,
    required String reason,
    String? lesson_name,
    String? class_name,
    List<QuizAnswer>? answers,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
