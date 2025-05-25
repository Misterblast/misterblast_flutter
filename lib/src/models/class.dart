import 'package:freezed_annotation/freezed_annotation.dart';

part 'class.g.dart';
part 'class.freezed.dart';

@freezed
abstract class Class with _$Class {
  const factory Class({required int id, required String name}) = _Class;
  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
