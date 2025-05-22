// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSubmission _$QuizSubmissionFromJson(Map<String, dynamic> json) =>
    _QuizSubmission(
      id: json['id'] as String,
      setId: json['set_id'] as String,
      name: json['name'] as String,
      correct: (json['correct'] as num).toInt(),
      grade: (json['grade'] as num).toInt(),
      lesson: json['lesson'] as String,
      className: json['class'] as String,
      submittedAt: (json['submitted_at'] as num).toInt(),
    );

Map<String, dynamic> _$QuizSubmissionToJson(_QuizSubmission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'set_id': instance.setId,
      'name': instance.name,
      'correct': instance.correct,
      'grade': instance.grade,
      'lesson': instance.lesson,
      'class': instance.className,
      'submitted_at': instance.submittedAt,
    };
