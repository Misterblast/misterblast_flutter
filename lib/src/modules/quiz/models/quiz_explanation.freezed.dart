// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_explanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizExplanation {
  int get id;
  String get grade;
  int get correct;
  int get wrong;
  String get lesson;
  @JsonKey(name: "attempt_no")
  int get attemptNo;
  @JsonKey(name: "submitted_at")
  int get submittedAt;
  List<QuizAnswerExplanation> get answers;

  /// Create a copy of QuizExplanation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizExplanationCopyWith<QuizExplanation> get copyWith =>
      _$QuizExplanationCopyWithImpl<QuizExplanation>(
          this as QuizExplanation, _$identity);

  /// Serializes this QuizExplanation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizExplanation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      grade,
      correct,
      wrong,
      lesson,
      attemptNo,
      submittedAt,
      const DeepCollectionEquality().hash(answers));

  @override
  String toString() {
    return 'QuizExplanation(id: $id, grade: $grade, correct: $correct, wrong: $wrong, lesson: $lesson, attemptNo: $attemptNo, submittedAt: $submittedAt, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class $QuizExplanationCopyWith<$Res> {
  factory $QuizExplanationCopyWith(
          QuizExplanation value, $Res Function(QuizExplanation) _then) =
      _$QuizExplanationCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String grade,
      int correct,
      int wrong,
      String lesson,
      @JsonKey(name: "attempt_no") int attemptNo,
      @JsonKey(name: "submitted_at") int submittedAt,
      List<QuizAnswerExplanation> answers});
}

/// @nodoc
class _$QuizExplanationCopyWithImpl<$Res>
    implements $QuizExplanationCopyWith<$Res> {
  _$QuizExplanationCopyWithImpl(this._self, this._then);

  final QuizExplanation _self;
  final $Res Function(QuizExplanation) _then;

  /// Create a copy of QuizExplanation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? grade = null,
    Object? correct = null,
    Object? wrong = null,
    Object? lesson = null,
    Object? attemptNo = null,
    Object? submittedAt = null,
    Object? answers = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      grade: null == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      wrong: null == wrong
          ? _self.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as String,
      attemptNo: null == attemptNo
          ? _self.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: null == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswerExplanation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizExplanation implements QuizExplanation {
  const _QuizExplanation(
      {required this.id,
      required this.grade,
      required this.correct,
      required this.wrong,
      required this.lesson,
      @JsonKey(name: "attempt_no") required this.attemptNo,
      @JsonKey(name: "submitted_at") required this.submittedAt,
      required final List<QuizAnswerExplanation> answers})
      : _answers = answers;
  factory _QuizExplanation.fromJson(Map<String, dynamic> json) =>
      _$QuizExplanationFromJson(json);

  @override
  final int id;
  @override
  final String grade;
  @override
  final int correct;
  @override
  final int wrong;
  @override
  final String lesson;
  @override
  @JsonKey(name: "attempt_no")
  final int attemptNo;
  @override
  @JsonKey(name: "submitted_at")
  final int submittedAt;
  final List<QuizAnswerExplanation> _answers;
  @override
  List<QuizAnswerExplanation> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  /// Create a copy of QuizExplanation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizExplanationCopyWith<_QuizExplanation> get copyWith =>
      __$QuizExplanationCopyWithImpl<_QuizExplanation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizExplanationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizExplanation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      grade,
      correct,
      wrong,
      lesson,
      attemptNo,
      submittedAt,
      const DeepCollectionEquality().hash(_answers));

  @override
  String toString() {
    return 'QuizExplanation(id: $id, grade: $grade, correct: $correct, wrong: $wrong, lesson: $lesson, attemptNo: $attemptNo, submittedAt: $submittedAt, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class _$QuizExplanationCopyWith<$Res>
    implements $QuizExplanationCopyWith<$Res> {
  factory _$QuizExplanationCopyWith(
          _QuizExplanation value, $Res Function(_QuizExplanation) _then) =
      __$QuizExplanationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String grade,
      int correct,
      int wrong,
      String lesson,
      @JsonKey(name: "attempt_no") int attemptNo,
      @JsonKey(name: "submitted_at") int submittedAt,
      List<QuizAnswerExplanation> answers});
}

/// @nodoc
class __$QuizExplanationCopyWithImpl<$Res>
    implements _$QuizExplanationCopyWith<$Res> {
  __$QuizExplanationCopyWithImpl(this._self, this._then);

  final _QuizExplanation _self;
  final $Res Function(_QuizExplanation) _then;

  /// Create a copy of QuizExplanation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? grade = null,
    Object? correct = null,
    Object? wrong = null,
    Object? lesson = null,
    Object? attemptNo = null,
    Object? submittedAt = null,
    Object? answers = null,
  }) {
    return _then(_QuizExplanation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      grade: null == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      wrong: null == wrong
          ? _self.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as String,
      attemptNo: null == attemptNo
          ? _self.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: null == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswerExplanation>,
    ));
  }
}

// dart format on
