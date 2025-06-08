// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      lastUpdatedAt: json['last_updated_at'] as String?,
    );

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'description': instance.description,
      'last_updated_at': instance.lastUpdatedAt,
    };

_TaskDetail _$TaskDetailFromJson(Map<String, dynamic> json) => _TaskDetail(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      lastUpdatedAt: json['last_updated_at'] as String?,
      attachedUrl: json['attached_url'] as String?,
    );

Map<String, dynamic> _$TaskDetailToJson(_TaskDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'description': instance.description,
      'last_updated_at': instance.lastUpdatedAt,
      'attached_url': instance.attachedUrl,
    };
