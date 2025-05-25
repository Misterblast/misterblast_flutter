// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExampleSet _$ExampleSetFromJson(Map<String, dynamic> json) => _ExampleSet(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lesson: json['lesson'] as String,
      className: json['class'] as String,
      isQuiz: json['is_quiz'] as bool,
    );

Map<String, dynamic> _$ExampleSetToJson(_ExampleSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lesson': instance.lesson,
      'class': instance.className,
      'is_quiz': instance.isQuiz,
    };
