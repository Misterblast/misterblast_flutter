// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSubmission {
  int get id;
  int get correct;
  int get grade;
  String get lesson;
  @JsonKey(name: 'set_id')
  int? get setId;
  @JsonKey(name: 'submitted_at')
  String? get submittedAt;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSubmissionCopyWith<QuizSubmission> get copyWith =>
      _$QuizSubmissionCopyWithImpl<QuizSubmission>(
          this as QuizSubmission, _$identity);

  /// Serializes this QuizSubmission to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSubmission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, correct, grade, lesson, setId, submittedAt);

  @override
  String toString() {
    return 'QuizSubmission(id: $id, correct: $correct, grade: $grade, lesson: $lesson, setId: $setId, submittedAt: $submittedAt)';
  }
}

/// @nodoc
abstract mixin class $QuizSubmissionCopyWith<$Res> {
  factory $QuizSubmissionCopyWith(
          QuizSubmission value, $Res Function(QuizSubmission) _then) =
      _$QuizSubmissionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int correct,
      int grade,
      String lesson,
      @JsonKey(name: 'set_id') int? setId,
      @JsonKey(name: 'submitted_at') String? submittedAt});
}

/// @nodoc
class _$QuizSubmissionCopyWithImpl<$Res>
    implements $QuizSubmissionCopyWith<$Res> {
  _$QuizSubmissionCopyWithImpl(this._self, this._then);

  final QuizSubmission _self;
  final $Res Function(QuizSubmission) _then;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correct = null,
    Object? grade = null,
    Object? lesson = null,
    Object? setId = freezed,
    Object? submittedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      grade: null == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as String,
      setId: freezed == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSubmission implements QuizSubmission {
  const _QuizSubmission(
      {required this.id,
      required this.correct,
      required this.grade,
      required this.lesson,
      @JsonKey(name: 'set_id') this.setId,
      @JsonKey(name: 'submitted_at') this.submittedAt});
  factory _QuizSubmission.fromJson(Map<String, dynamic> json) =>
      _$QuizSubmissionFromJson(json);

  @override
  final int id;
  @override
  final int correct;
  @override
  final int grade;
  @override
  final String lesson;
  @override
  @JsonKey(name: 'set_id')
  final int? setId;
  @override
  @JsonKey(name: 'submitted_at')
  final String? submittedAt;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSubmissionCopyWith<_QuizSubmission> get copyWith =>
      __$QuizSubmissionCopyWithImpl<_QuizSubmission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSubmissionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSubmission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, correct, grade, lesson, setId, submittedAt);

  @override
  String toString() {
    return 'QuizSubmission(id: $id, correct: $correct, grade: $grade, lesson: $lesson, setId: $setId, submittedAt: $submittedAt)';
  }
}

/// @nodoc
abstract mixin class _$QuizSubmissionCopyWith<$Res>
    implements $QuizSubmissionCopyWith<$Res> {
  factory _$QuizSubmissionCopyWith(
          _QuizSubmission value, $Res Function(_QuizSubmission) _then) =
      __$QuizSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int correct,
      int grade,
      String lesson,
      @JsonKey(name: 'set_id') int? setId,
      @JsonKey(name: 'submitted_at') String? submittedAt});
}

/// @nodoc
class __$QuizSubmissionCopyWithImpl<$Res>
    implements _$QuizSubmissionCopyWith<$Res> {
  __$QuizSubmissionCopyWithImpl(this._self, this._then);

  final _QuizSubmission _self;
  final $Res Function(_QuizSubmission) _then;

  /// Create a copy of QuizSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? correct = null,
    Object? grade = null,
    Object? lesson = null,
    Object? setId = freezed,
    Object? submittedAt = freezed,
  }) {
    return _then(_QuizSubmission(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      grade: null == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as String,
      setId: freezed == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
