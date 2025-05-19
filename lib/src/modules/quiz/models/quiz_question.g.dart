// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      type: json['type'] as String,
      content: json['content'] as String,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'type': instance.type,
      'content': instance.content,
      'answers': instance.answers,
    };
