// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQuestion {
  int get id;
  int get number;
  String get type;
  String get content;
  List<QuizAnswer>? get answers;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      _$QuizQuestionCopyWithImpl<QuizQuestion>(
          this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, type, content,
      const DeepCollectionEquality().hash(answers));

  @override
  String toString() {
    return 'QuizQuestion(id: $id, number: $number, type: $type, content: $content, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) _then) =
      _$QuizQuestionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int number,
      String type,
      String content,
      List<QuizAnswer>? answers});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res> implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? type = null,
    Object? content = null,
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
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      answers: freezed == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion(
      {required this.id,
      required this.number,
      required this.type,
      required this.content,
      final List<QuizAnswer>? answers})
      : _answers = answers;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);

  @override
  final int id;
  @override
  final int number;
  @override
  final String type;
  @override
  final String content;
  final List<QuizAnswer>? _answers;
  @override
  List<QuizAnswer>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizQuestionCopyWith<_QuizQuestion> get copyWith =>
      __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizQuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, type, content,
      const DeepCollectionEquality().hash(_answers));

  @override
  String toString() {
    return 'QuizQuestion(id: $id, number: $number, type: $type, content: $content, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(
          _QuizQuestion value, $Res Function(_QuizQuestion) _then) =
      __$QuizQuestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int number,
      String type,
      String content,
      List<QuizAnswer>? answers});
}

/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? type = null,
    Object? content = null,
    Object? answers = freezed,
  }) {
    return _then(_QuizQuestion(
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
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      answers: freezed == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>?,
    ));
  }
}

// dart format on
