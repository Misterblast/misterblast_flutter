// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSummary _$UserSummaryFromJson(Map<String, dynamic> json) => _UserSummary(
      totalQuizAttempts: (json['total_quiz_attempts'] as num).toDouble(),
      averageQuizScore: (json['avg_quiz_score'] as num).toDouble(),
      totalTaskAttempts: (json['total_task_attempts'] as num).toDouble(),
      averageTaskScore: (json['avg_task_score'] as num).toDouble(),
    );

Map<String, dynamic> _$UserSummaryToJson(_UserSummary instance) =>
    <String, dynamic>{
      'total_quiz_attempts': instance.totalQuizAttempts,
      'avg_quiz_score': instance.averageQuizScore,
      'total_task_attempts': instance.totalTaskAttempts,
      'avg_task_score': instance.averageTaskScore,
    };
