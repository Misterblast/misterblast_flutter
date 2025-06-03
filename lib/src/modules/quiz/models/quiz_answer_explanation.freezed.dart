// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer_explanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizAnswerExplanation {
  int get number;
  @JsonKey(name: "user_code")
  String get userCode;
  @JsonKey(name: "actual_code")
  String get actualCode;
  @JsonKey(name: "user_content")
  String get userContent;
  @JsonKey(name: "actual_content")
  String get actualContent;
  @JsonKey(name: "question_content")
  String get questionContent;
  @JsonKey(name: "is_correct")
  bool get isCorrect;
  String get explanation;
  String get reason;
  @JsonKey(name: "Format")
  String get format;

  /// Create a copy of QuizAnswerExplanation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizAnswerExplanationCopyWith<QuizAnswerExplanation> get copyWith =>
      _$QuizAnswerExplanationCopyWithImpl<QuizAnswerExplanation>(
          this as QuizAnswerExplanation, _$identity);

  /// Serializes this QuizAnswerExplanation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizAnswerExplanation &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode) &&
            (identical(other.actualCode, actualCode) ||
                other.actualCode == actualCode) &&
            (identical(other.userContent, userContent) ||
                other.userContent == userContent) &&
            (identical(other.actualContent, actualContent) ||
                other.actualContent == actualContent) &&
            (identical(other.questionContent, questionContent) ||
                other.questionContent == questionContent) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      userCode,
      actualCode,
      userContent,
      actualContent,
      questionContent,
      isCorrect,
      explanation,
      reason,
      format);

  @override
  String toString() {
    return 'QuizAnswerExplanation(number: $number, userCode: $userCode, actualCode: $actualCode, userContent: $userContent, actualContent: $actualContent, questionContent: $questionContent, isCorrect: $isCorrect, explanation: $explanation, reason: $reason, format: $format)';
  }
}

/// @nodoc
abstract mixin class $QuizAnswerExplanationCopyWith<$Res> {
  factory $QuizAnswerExplanationCopyWith(QuizAnswerExplanation value,
          $Res Function(QuizAnswerExplanation) _then) =
      _$QuizAnswerExplanationCopyWithImpl;
  @useResult
  $Res call(
      {int number,
      @JsonKey(name: "user_code") String userCode,
      @JsonKey(name: "actual_code") String actualCode,
      @JsonKey(name: "user_content") String userContent,
      @JsonKey(name: "actual_content") String actualContent,
      @JsonKey(name: "question_content") String questionContent,
      @JsonKey(name: "is_correct") bool isCorrect,
      String explanation,
      String reason,
      @JsonKey(name: "Format") String format});
}

/// @nodoc
class _$QuizAnswerExplanationCopyWithImpl<$Res>
    implements $QuizAnswerExplanationCopyWith<$Res> {
  _$QuizAnswerExplanationCopyWithImpl(this._self, this._then);

  final QuizAnswerExplanation _self;
  final $Res Function(QuizAnswerExplanation) _then;

  /// Create a copy of QuizAnswerExplanation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? userCode = null,
    Object? actualCode = null,
    Object? userContent = null,
    Object? actualContent = null,
    Object? questionContent = null,
    Object? isCorrect = null,
    Object? explanation = null,
    Object? reason = null,
    Object? format = null,
  }) {
    return _then(_self.copyWith(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      userCode: null == userCode
          ? _self.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      actualCode: null == actualCode
          ? _self.actualCode
          : actualCode // ignore: cast_nullable_to_non_nullable
              as String,
      userContent: null == userContent
          ? _self.userContent
          : userContent // ignore: cast_nullable_to_non_nullable
              as String,
      actualContent: null == actualContent
          ? _self.actualContent
          : actualContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _self.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizAnswerExplanation implements QuizAnswerExplanation {
  const _QuizAnswerExplanation(
      {required this.number,
      @JsonKey(name: "user_code") this.userCode = "-",
      @JsonKey(name: "actual_code") this.actualCode = "-",
      @JsonKey(name: "user_content") this.userContent = "-",
      @JsonKey(name: "actual_content") this.actualContent = "-",
      @JsonKey(name: "question_content") this.questionContent = "-",
      @JsonKey(name: "is_correct") this.isCorrect = false,
      this.explanation = "-",
      this.reason = "-",
      @JsonKey(name: "Format") this.format = "-"});
  factory _QuizAnswerExplanation.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerExplanationFromJson(json);

  @override
  final int number;
  @override
  @JsonKey(name: "user_code")
  final String userCode;
  @override
  @JsonKey(name: "actual_code")
  final String actualCode;
  @override
  @JsonKey(name: "user_content")
  final String userContent;
  @override
  @JsonKey(name: "actual_content")
  final String actualContent;
  @override
  @JsonKey(name: "question_content")
  final String questionContent;
  @override
  @JsonKey(name: "is_correct")
  final bool isCorrect;
  @override
  @JsonKey()
  final String explanation;
  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey(name: "Format")
  final String format;

  /// Create a copy of QuizAnswerExplanation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizAnswerExplanationCopyWith<_QuizAnswerExplanation> get copyWith =>
      __$QuizAnswerExplanationCopyWithImpl<_QuizAnswerExplanation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizAnswerExplanationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizAnswerExplanation &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode) &&
            (identical(other.actualCode, actualCode) ||
                other.actualCode == actualCode) &&
            (identical(other.userContent, userContent) ||
                other.userContent == userContent) &&
            (identical(other.actualContent, actualContent) ||
                other.actualContent == actualContent) &&
            (identical(other.questionContent, questionContent) ||
                other.questionContent == questionContent) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.format, format) || other.format == format));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      userCode,
      actualCode,
      userContent,
      actualContent,
      questionContent,
      isCorrect,
      explanation,
      reason,
      format);

  @override
  String toString() {
    return 'QuizAnswerExplanation(number: $number, userCode: $userCode, actualCode: $actualCode, userContent: $userContent, actualContent: $actualContent, questionContent: $questionContent, isCorrect: $isCorrect, explanation: $explanation, reason: $reason, format: $format)';
  }
}

/// @nodoc
abstract mixin class _$QuizAnswerExplanationCopyWith<$Res>
    implements $QuizAnswerExplanationCopyWith<$Res> {
  factory _$QuizAnswerExplanationCopyWith(_QuizAnswerExplanation value,
          $Res Function(_QuizAnswerExplanation) _then) =
      __$QuizAnswerExplanationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int number,
      @JsonKey(name: "user_code") String userCode,
      @JsonKey(name: "actual_code") String actualCode,
      @JsonKey(name: "user_content") String userContent,
      @JsonKey(name: "actual_content") String actualContent,
      @JsonKey(name: "question_content") String questionContent,
      @JsonKey(name: "is_correct") bool isCorrect,
      String explanation,
      String reason,
      @JsonKey(name: "Format") String format});
}

/// @nodoc
class __$QuizAnswerExplanationCopyWithImpl<$Res>
    implements _$QuizAnswerExplanationCopyWith<$Res> {
  __$QuizAnswerExplanationCopyWithImpl(this._self, this._then);

  final _QuizAnswerExplanation _self;
  final $Res Function(_QuizAnswerExplanation) _then;

  /// Create a copy of QuizAnswerExplanation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? userCode = null,
    Object? actualCode = null,
    Object? userContent = null,
    Object? actualContent = null,
    Object? questionContent = null,
    Object? isCorrect = null,
    Object? explanation = null,
    Object? reason = null,
    Object? format = null,
  }) {
    return _then(_QuizAnswerExplanation(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      userCode: null == userCode
          ? _self.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String,
      actualCode: null == actualCode
          ? _self.actualCode
          : actualCode // ignore: cast_nullable_to_non_nullable
              as String,
      userContent: null == userContent
          ? _self.userContent
          : userContent // ignore: cast_nullable_to_non_nullable
              as String,
      actualContent: null == actualContent
          ? _self.actualContent
          : actualContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _self.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
