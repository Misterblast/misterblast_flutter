import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer.g.dart';
part 'quiz_answer.freezed.dart';

@freezed
abstract class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required int id,
    required String code,
    required String content,
    @JsonKey(name: "img_url") String? img_url,
  }) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerFromJson(json);
}
