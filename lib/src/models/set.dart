import 'package:freezed_annotation/freezed_annotation.dart';

part 'set.g.dart';
part 'set.freezed.dart';

@freezed
abstract class ExampleSet with _$ExampleSet {
  const factory ExampleSet({
    required int id,
    required String name,
    required String lesson,
    @JsonKey(name: "class") required String className,
    @JsonKey(name: 'is_quiz') required bool isQuiz,
  }) = _ExampleSet;

  factory ExampleSet.fromJson(Map<String, dynamic> json) =>
      _$ExampleSetFromJson(json);
}
