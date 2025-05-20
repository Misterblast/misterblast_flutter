// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answer_explanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizAnswerExplanation _$QuizAnswerExplanationFromJson(
        Map<String, dynamic> json) =>
    _QuizAnswerExplanation(
      number: (json['number'] as num).toInt(),
      userCode: json['user_code'] as String,
      actualCode: json['actual_code'] as String,
      userContent: json['user_content'] as String,
      actualContent: json['actual_content'] as String,
      questionContent: json['question_content'] as String,
      isCorrect: json['is_correct'] as bool,
      explanation: json['explanation'] as String,
      reason: json['reason'] as String,
      format: json['Format'] as String,
    );

Map<String, dynamic> _$QuizAnswerExplanationToJson(
        _QuizAnswerExplanation instance) =>
    <String, dynamic>{
      'number': instance.number,
      'user_code': instance.userCode,
      'actual_code': instance.actualCode,
      'user_content': instance.userContent,
      'actual_content': instance.actualContent,
      'question_content': instance.questionContent,
      'is_correct': instance.isCorrect,
      'explanation': instance.explanation,
      'reason': instance.reason,
      'Format': instance.format,
    };
