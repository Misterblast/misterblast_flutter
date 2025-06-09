// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskSubmission _$TaskSubmissionFromJson(Map<String, dynamic> json) =>
    _TaskSubmission(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      submittedAt: json['submitted_at'] as String,
      scoredAt: json['scored_at'] as String?,
      feedback: json['feedback'] as String?,
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskSubmissionToJson(_TaskSubmission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'submitted_at': instance.submittedAt,
      'scored_at': instance.scoredAt,
      'feedback': instance.feedback,
      'score': instance.score,
    };
