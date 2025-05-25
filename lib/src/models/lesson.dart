import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.g.dart';
part 'lesson.freezed.dart';

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({required int id, required String name, String? code}) =
      _Lesson;
  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
