import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary.g.dart';
part 'user_summary.freezed.dart';

@freezed
abstract class UserSummary with _$UserSummary {
  const factory UserSummary({
    @JsonKey(name: "total_quiz_attempts") required double totalQuizAttempts,
    @JsonKey(name: "avg_quiz_score") required double averageQuizScore,
    @JsonKey(name: "total_task_attempts") required double totalTaskAttempts,
    @JsonKey(name: "avg_task_score") required double averageTaskScore,
  }) = _UserSummary;
  factory UserSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryFromJson(json);
}
