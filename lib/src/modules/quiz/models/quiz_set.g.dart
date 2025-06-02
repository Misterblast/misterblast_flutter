// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSet _$QuizSetFromJson(Map<String, dynamic> json) => _QuizSet(
      setId: (json['set_id'] as num?)?.toInt(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizSetToJson(_QuizSet instance) => <String, dynamic>{
      'set_id': instance.setId,
      'questions': instance.questions,
    };
