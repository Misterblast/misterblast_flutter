import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_question.dart';

part 'quiz_set.g.dart';
part 'quiz_set.freezed.dart';

@freezed
abstract class QuizSet with _$QuizSet {
  const factory QuizSet({
    // ignore: invalid_annotation_target
    @JsonKey(name: "set_id") int? setId,
    required List<QuizQuestion> questions,
  }) = _QuizSet;

  factory QuizSet.fromJson(Map<String, dynamic> json) =>
      _$QuizSetFromJson(json);
}
