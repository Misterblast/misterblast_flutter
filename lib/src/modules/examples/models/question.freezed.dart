// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {
  int get id;
  int get number;
  String get type;
  String get format;
  String get content;
  String get explanation;
  String get reason;
  int? get set_id;
  String? get set_name;
  String? get lesson_name;
  String? get class_name;
  List<QuizAnswer>? get answers;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<Question> get copyWith =>
      _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.set_id, set_id) || other.set_id == set_id) &&
            (identical(other.set_name, set_name) ||
                other.set_name == set_name) &&
            (identical(other.lesson_name, lesson_name) ||
                other.lesson_name == lesson_name) &&
            (identical(other.class_name, class_name) ||
                other.class_name == class_name) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      type,
      format,
      content,
      explanation,
      reason,
      set_id,
      set_name,
      lesson_name,
      class_name,
      const DeepCollectionEquality().hash(answers));

  @override
  String toString() {
    return 'Question(id: $id, number: $number, type: $type, format: $format, content: $content, explanation: $explanation, reason: $reason, set_id: $set_id, set_name: $set_name, lesson_name: $lesson_name, class_name: $class_name, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) =
      _$QuestionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int number,
      String type,
      String format,
      String content,
      String explanation,
      String reason,
      int? set_id,
      String? set_name,
      String? lesson_name,
      String? class_name,
      List<QuizAnswer>? answers});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? type = null,
    Object? format = null,
    Object? content = null,
    Object? explanation = null,
    Object? reason = null,
    Object? set_id = freezed,
    Object? set_name = freezed,
    Object? lesson_name = freezed,
    Object? class_name = freezed,
    Object? answers = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      set_id: freezed == set_id
          ? _self.set_id
          : set_id // ignore: cast_nullable_to_non_nullable
              as int?,
      set_name: freezed == set_name
          ? _self.set_name
          : set_name // ignore: cast_nullable_to_non_nullable
              as String?,
      lesson_name: freezed == lesson_name
          ? _self.lesson_name
          : lesson_name // ignore: cast_nullable_to_non_nullable
              as String?,
      class_name: freezed == class_name
          ? _self.class_name
          : class_name // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Question implements Question {
  const _Question(
      {required this.id,
      required this.number,
      required this.type,
      required this.format,
      required this.content,
      required this.explanation,
      required this.reason,
      this.set_id,
      this.set_name,
      this.lesson_name,
      this.class_name,
      final List<QuizAnswer>? answers})
      : _answers = answers;
  factory _Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  final int id;
  @override
  final int number;
  @override
  final String type;
  @override
  final String format;
  @override
  final String content;
  @override
  final String explanation;
  @override
  final String reason;
  @override
  final int? set_id;
  @override
  final String? set_name;
  @override
  final String? lesson_name;
  @override
  final String? class_name;
  final List<QuizAnswer>? _answers;
  @override
  List<QuizAnswer>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.set_id, set_id) || other.set_id == set_id) &&
            (identical(other.set_name, set_name) ||
                other.set_name == set_name) &&
            (identical(other.lesson_name, lesson_name) ||
                other.lesson_name == lesson_name) &&
            (identical(other.class_name, class_name) ||
                other.class_name == class_name) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      type,
      format,
      content,
      explanation,
      reason,
      set_id,
      set_name,
      lesson_name,
      class_name,
      const DeepCollectionEquality().hash(_answers));

  @override
  String toString() {
    return 'Question(id: $id, number: $number, type: $type, format: $format, content: $content, explanation: $explanation, reason: $reason, set_id: $set_id, set_name: $set_name, lesson_name: $lesson_name, class_name: $class_name, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) =
      __$QuestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int number,
      String type,
      String format,
      String content,
      String explanation,
      String reason,
      int? set_id,
      String? set_name,
      String? lesson_name,
      String? class_name,
      List<QuizAnswer>? answers});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? type = null,
    Object? format = null,
    Object? content = null,
    Object? explanation = null,
    Object? reason = null,
    Object? set_id = freezed,
    Object? set_name = freezed,
    Object? lesson_name = freezed,
    Object? class_name = freezed,
    Object? answers = freezed,
  }) {
    return _then(_Question(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      set_id: freezed == set_id
          ? _self.set_id
          : set_id // ignore: cast_nullable_to_non_nullable
              as int?,
      set_name: freezed == set_name
          ? _self.set_name
          : set_name // ignore: cast_nullable_to_non_nullable
              as String?,
      lesson_name: freezed == lesson_name
          ? _self.lesson_name
          : lesson_name // ignore: cast_nullable_to_non_nullable
              as String?,
      class_name: freezed == class_name
          ? _self.class_name
          : class_name // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>?,
    ));
  }
}

// dart format on
