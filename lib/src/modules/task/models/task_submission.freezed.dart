// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskSubmission {
  int get id;
  String get title;
  String get description;
  String get content;
  @JsonKey(name: "submitted_at")
  String get submittedAt;
  @JsonKey(name: "scored_at")
  String? get scoredAt;
  String? get feedback;
  int? get score;

  /// Create a copy of TaskSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskSubmissionCopyWith<TaskSubmission> get copyWith =>
      _$TaskSubmissionCopyWithImpl<TaskSubmission>(
          this as TaskSubmission, _$identity);

  /// Serializes this TaskSubmission to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskSubmission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.scoredAt, scoredAt) ||
                other.scoredAt == scoredAt) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, content,
      submittedAt, scoredAt, feedback, score);

  @override
  String toString() {
    return 'TaskSubmission(id: $id, title: $title, description: $description, content: $content, submittedAt: $submittedAt, scoredAt: $scoredAt, feedback: $feedback, score: $score)';
  }
}

/// @nodoc
abstract mixin class $TaskSubmissionCopyWith<$Res> {
  factory $TaskSubmissionCopyWith(
          TaskSubmission value, $Res Function(TaskSubmission) _then) =
      _$TaskSubmissionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String content,
      @JsonKey(name: "submitted_at") String submittedAt,
      @JsonKey(name: "scored_at") String? scoredAt,
      String? feedback,
      int? score});
}

/// @nodoc
class _$TaskSubmissionCopyWithImpl<$Res>
    implements $TaskSubmissionCopyWith<$Res> {
  _$TaskSubmissionCopyWithImpl(this._self, this._then);

  final TaskSubmission _self;
  final $Res Function(TaskSubmission) _then;

  /// Create a copy of TaskSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? submittedAt = null,
    Object? scoredAt = freezed,
    Object? feedback = freezed,
    Object? score = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      submittedAt: null == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String,
      scoredAt: freezed == scoredAt
          ? _self.scoredAt
          : scoredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: freezed == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TaskSubmission implements TaskSubmission {
  const _TaskSubmission(
      {required this.id,
      required this.title,
      required this.description,
      required this.content,
      @JsonKey(name: "submitted_at") required this.submittedAt,
      @JsonKey(name: "scored_at") this.scoredAt,
      this.feedback,
      this.score});
  factory _TaskSubmission.fromJson(Map<String, dynamic> json) =>
      _$TaskSubmissionFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String content;
  @override
  @JsonKey(name: "submitted_at")
  final String submittedAt;
  @override
  @JsonKey(name: "scored_at")
  final String? scoredAt;
  @override
  final String? feedback;
  @override
  final int? score;

  /// Create a copy of TaskSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskSubmissionCopyWith<_TaskSubmission> get copyWith =>
      __$TaskSubmissionCopyWithImpl<_TaskSubmission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskSubmissionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskSubmission &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.scoredAt, scoredAt) ||
                other.scoredAt == scoredAt) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, content,
      submittedAt, scoredAt, feedback, score);

  @override
  String toString() {
    return 'TaskSubmission(id: $id, title: $title, description: $description, content: $content, submittedAt: $submittedAt, scoredAt: $scoredAt, feedback: $feedback, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$TaskSubmissionCopyWith<$Res>
    implements $TaskSubmissionCopyWith<$Res> {
  factory _$TaskSubmissionCopyWith(
          _TaskSubmission value, $Res Function(_TaskSubmission) _then) =
      __$TaskSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String content,
      @JsonKey(name: "submitted_at") String submittedAt,
      @JsonKey(name: "scored_at") String? scoredAt,
      String? feedback,
      int? score});
}

/// @nodoc
class __$TaskSubmissionCopyWithImpl<$Res>
    implements _$TaskSubmissionCopyWith<$Res> {
  __$TaskSubmissionCopyWithImpl(this._self, this._then);

  final _TaskSubmission _self;
  final $Res Function(_TaskSubmission) _then;

  /// Create a copy of TaskSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? submittedAt = null,
    Object? scoredAt = freezed,
    Object? feedback = freezed,
    Object? score = freezed,
  }) {
    return _then(_TaskSubmission(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      submittedAt: null == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String,
      scoredAt: freezed == scoredAt
          ? _self.scoredAt
          : scoredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: freezed == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
