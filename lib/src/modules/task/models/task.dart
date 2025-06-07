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

// {id: 23, title: task 5, description: description task 5, content: content task 5, last_updated_at: 1743847931}
