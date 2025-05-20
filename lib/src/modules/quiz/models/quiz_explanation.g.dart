// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_explanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizExplanation _$QuizExplanationFromJson(Map<String, dynamic> json) =>
    _QuizExplanation(
      id: (json['id'] as num).toInt(),
      grade: json['grade'] as String,
      correct: (json['correct'] as num).toInt(),
      wrong: (json['wrong'] as num).toInt(),
      attemptNo: (json['attempt_no'] as num).toInt(),
      submittedAt: (json['submitted_at'] as num).toInt(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => QuizAnswerExplanation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizExplanationToJson(_QuizExplanation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade': instance.grade,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'attempt_no': instance.attemptNo,
      'submitted_at': instance.submittedAt,
      'answers': instance.answers,
    };
