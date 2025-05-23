// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) => _QuizAnswer(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      content: json['content'] as String,
      imageUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$QuizAnswerToJson(_QuizAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'content': instance.content,
      'img_url': instance.imageUrl,
    };
