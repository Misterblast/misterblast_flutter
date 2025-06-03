// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSubmission _$QuizSubmissionFromJson(Map<String, dynamic> json) =>
    _QuizSubmission(
      id: (json['id'] as num).toInt(),
      correct: (json['correct'] as num).toInt(),
      grade: (json['grade'] as num).toInt(),
      lesson: json['lesson'] as String,
      setId: (json['set_id'] as num?)?.toInt(),
      submittedAt: json['submitted_at'] as String?,
    );

Map<String, dynamic> _$QuizSubmissionToJson(_QuizSubmission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct': instance.correct,
      'grade': instance.grade,
      'lesson': instance.lesson,
      'set_id': instance.setId,
      'submitted_at': instance.submittedAt,
    };
