// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      type: json['type'] as String,
      format: json['format'] as String,
      content: json['content'] as String,
      explanation: json['explanation'] as String,
      reason: json['reason'] as String,
      set_id: (json['set_id'] as num?)?.toInt(),
      set_name: json['set_name'] as String?,
      lesson_name: json['lesson_name'] as String?,
      class_name: json['class_name'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'type': instance.type,
      'format': instance.format,
      'content': instance.content,
      'explanation': instance.explanation,
      'reason': instance.reason,
      'set_id': instance.set_id,
      'set_name': instance.set_name,
      'lesson_name': instance.lesson_name,
      'class_name': instance.class_name,
      'answers': instance.answers,
    };
