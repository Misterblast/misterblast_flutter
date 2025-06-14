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
      scoredAt: json['scored_at'] as String?,
      submittedAt: json['submitted_at'] as String?,
      taskAttachmentUrl: json['task_attachment_url'] as String?,
      answerAttachmentUrl: json['answer_attachment_url'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$TaskSubmissionDetailToJson(
        _TaskSubmissionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'scored_at': instance.scoredAt,
      'submitted_at': instance.submittedAt,
      'task_attachment_url': instance.taskAttachmentUrl,
      'answer_attachment_url': instance.answerAttachmentUrl,
      'score': instance.score,
      'feedback': instance.feedback,
      'answer': instance.answer,
    };
