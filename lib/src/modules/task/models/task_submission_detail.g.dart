// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_submission_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskSubmissionDetail _$TaskSubmissionDetailFromJson(
        Map<String, dynamic> json) =>
    _TaskSubmissionDetail(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      score: (json['score'] as num?)?.toDouble(),
      scoredAt: json['scoredAt'] == null
          ? null
          : DateTime.parse(json['scoredAt'] as String),
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      feedback: json['feedback'] as String?,
      answer: json['answer'] as String?,
      taskAttachmentUrl: json['task_attachment_url'] as String?,
      answerAttachmentUrl: json['answer_attachment_url'] as String?,
    );

Map<String, dynamic> _$TaskSubmissionDetailToJson(
        _TaskSubmissionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'score': instance.score,
      'scoredAt': instance.scoredAt?.toIso8601String(),
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'feedback': instance.feedback,
      'answer': instance.answer,
      'task_attachment_url': instance.taskAttachmentUrl,
      'answer_attachment_url': instance.answerAttachmentUrl,
    };
