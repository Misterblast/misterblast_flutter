// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.g.dart';
part 'task.freezed.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    int? id,
    String? title,
    String? content,
    String? description,
    @JsonKey(name: "last_updated_at") String? lastUpdatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
abstract class TaskDetail with _$TaskDetail {
  const factory TaskDetail({
    int? id,
    String? title,
    String? content,
    String? description,
    @JsonKey(name: "last_updated_at") String? lastUpdatedAt,
    @JsonKey(name: "attached_url") String? attachedUrl,
  }) = _TaskDetail;

  factory TaskDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailFromJson(json);
}
