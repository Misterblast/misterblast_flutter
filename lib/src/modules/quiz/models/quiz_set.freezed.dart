// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSet {
// ignore: invalid_annotation_target
  @JsonKey(name: "set_id")
  int? get setId;
  List<QuizQuestion> get questions;

  /// Create a copy of QuizSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetCopyWith<QuizSet> get copyWith =>
      _$QuizSetCopyWithImpl<QuizSet>(this as QuizSet, _$identity);

  /// Serializes this QuizSet to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSet &&
            (identical(other.setId, setId) || other.setId == setId) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, setId, const DeepCollectionEquality().hash(questions));

  @override
  String toString() {
    return 'QuizSet(setId: $setId, questions: $questions)';
  }
}

/// @nodoc
abstract mixin class $QuizSetCopyWith<$Res> {
  factory $QuizSetCopyWith(QuizSet value, $Res Function(QuizSet) _then) =
      _$QuizSetCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "set_id") int? setId, List<QuizQuestion> questions});
}

/// @nodoc
class _$QuizSetCopyWithImpl<$Res> implements $QuizSetCopyWith<$Res> {
  _$QuizSetCopyWithImpl(this._self, this._then);

  final QuizSet _self;
  final $Res Function(QuizSet) _then;

  /// Create a copy of QuizSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = freezed,
    Object? questions = null,
  }) {
    return _then(_self.copyWith(
      setId: freezed == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: null == questions
          ? _self.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSet implements QuizSet {
  const _QuizSet(
      {@JsonKey(name: "set_id") this.setId,
      required final List<QuizQuestion> questions})
      : _questions = questions;
  factory _QuizSet.fromJson(Map<String, dynamic> json) =>
      _$QuizSetFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "set_id")
  final int? setId;
  final List<QuizQuestion> _questions;
  @override
  List<QuizQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  /// Create a copy of QuizSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetCopyWith<_QuizSet> get copyWith =>
      __$QuizSetCopyWithImpl<_QuizSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSetToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSet &&
            (identical(other.setId, setId) || other.setId == setId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, setId, const DeepCollectionEquality().hash(_questions));

  @override
  String toString() {
    return 'QuizSet(setId: $setId, questions: $questions)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetCopyWith<$Res> implements $QuizSetCopyWith<$Res> {
  factory _$QuizSetCopyWith(_QuizSet value, $Res Function(_QuizSet) _then) =
      __$QuizSetCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "set_id") int? setId, List<QuizQuestion> questions});
}

/// @nodoc
class __$QuizSetCopyWithImpl<$Res> implements _$QuizSetCopyWith<$Res> {
  __$QuizSetCopyWithImpl(this._self, this._then);

  final _QuizSet _self;
  final $Res Function(_QuizSet) _then;

  /// Create a copy of QuizSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? setId = freezed,
    Object? questions = null,
  }) {
    return _then(_QuizSet(
      setId: freezed == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

// dart format on
