// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_submission_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskSubmissionDetail {
  int get id;
  String get title;
  String get description;
  String get content;
  @JsonKey(name: "scored_at")
  String? get scoredAt;
  @JsonKey(name: "submitted_at")
  String? get submittedAt;
  @JsonKey(name: "task_attachment_url")
  String? get taskAttachmentUrl;
  @JsonKey(name: "answer_attachment_url")
  String? get answerAttachmentUrl;
  double? get score;
  String? get feedback;
  String? get answer;

  /// Create a copy of TaskSubmissionDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskSubmissionDetailCopyWith<TaskSubmissionDetail> get copyWith =>
      _$TaskSubmissionDetailCopyWithImpl<TaskSubmissionDetail>(
          this as TaskSubmissionDetail, _$identity);

  /// Serializes this TaskSubmissionDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskSubmissionDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.scoredAt, scoredAt) ||
                other.scoredAt == scoredAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.taskAttachmentUrl, taskAttachmentUrl) ||
                other.taskAttachmentUrl == taskAttachmentUrl) &&
            (identical(other.answerAttachmentUrl, answerAttachmentUrl) ||
                other.answerAttachmentUrl == answerAttachmentUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      content,
      scoredAt,
      submittedAt,
      taskAttachmentUrl,
      answerAttachmentUrl,
      score,
      feedback,
      answer);

  @override
  String toString() {
    return 'TaskSubmissionDetail(id: $id, title: $title, description: $description, content: $content, scoredAt: $scoredAt, submittedAt: $submittedAt, taskAttachmentUrl: $taskAttachmentUrl, answerAttachmentUrl: $answerAttachmentUrl, score: $score, feedback: $feedback, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $TaskSubmissionDetailCopyWith<$Res> {
  factory $TaskSubmissionDetailCopyWith(TaskSubmissionDetail value,
          $Res Function(TaskSubmissionDetail) _then) =
      _$TaskSubmissionDetailCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String content,
      @JsonKey(name: "scored_at") String? scoredAt,
      @JsonKey(name: "submitted_at") String? submittedAt,
      @JsonKey(name: "task_attachment_url") String? taskAttachmentUrl,
      @JsonKey(name: "answer_attachment_url") String? answerAttachmentUrl,
      double? score,
      String? feedback,
      String? answer});
}

/// @nodoc
class _$TaskSubmissionDetailCopyWithImpl<$Res>
    implements $TaskSubmissionDetailCopyWith<$Res> {
  _$TaskSubmissionDetailCopyWithImpl(this._self, this._then);

  final TaskSubmissionDetail _self;
  final $Res Function(TaskSubmissionDetail) _then;

  /// Create a copy of TaskSubmissionDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? scoredAt = freezed,
    Object? submittedAt = freezed,
    Object? taskAttachmentUrl = freezed,
    Object? answerAttachmentUrl = freezed,
    Object? score = freezed,
    Object? feedback = freezed,
    Object? answer = freezed,
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
      scoredAt: freezed == scoredAt
          ? _self.scoredAt
          : scoredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskAttachmentUrl: freezed == taskAttachmentUrl
          ? _self.taskAttachmentUrl
          : taskAttachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAttachmentUrl: freezed == answerAttachmentUrl
          ? _self.answerAttachmentUrl
          : answerAttachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TaskSubmissionDetail implements TaskSubmissionDetail {
  const _TaskSubmissionDetail(
      {required this.id,
      required this.title,
      required this.description,
      required this.content,
      @JsonKey(name: "scored_at") this.scoredAt,
      @JsonKey(name: "submitted_at") this.submittedAt,
      @JsonKey(name: "task_attachment_url") this.taskAttachmentUrl,
      @JsonKey(name: "answer_attachment_url") this.answerAttachmentUrl,
      this.score,
      this.feedback,
      this.answer});
  factory _TaskSubmissionDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskSubmissionDetailFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String content;
  @override
  @JsonKey(name: "scored_at")
  final String? scoredAt;
  @override
  @JsonKey(name: "submitted_at")
  final String? submittedAt;
  @override
  @JsonKey(name: "task_attachment_url")
  final String? taskAttachmentUrl;
  @override
  @JsonKey(name: "answer_attachment_url")
  final String? answerAttachmentUrl;
  @override
  final double? score;
  @override
  final String? feedback;
  @override
  final String? answer;

  /// Create a copy of TaskSubmissionDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskSubmissionDetailCopyWith<_TaskSubmissionDetail> get copyWith =>
      __$TaskSubmissionDetailCopyWithImpl<_TaskSubmissionDetail>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskSubmissionDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskSubmissionDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.scoredAt, scoredAt) ||
                other.scoredAt == scoredAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.taskAttachmentUrl, taskAttachmentUrl) ||
                other.taskAttachmentUrl == taskAttachmentUrl) &&
            (identical(other.answerAttachmentUrl, answerAttachmentUrl) ||
                other.answerAttachmentUrl == answerAttachmentUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      content,
      scoredAt,
      submittedAt,
      taskAttachmentUrl,
      answerAttachmentUrl,
      score,
      feedback,
      answer);

  @override
  String toString() {
    return 'TaskSubmissionDetail(id: $id, title: $title, description: $description, content: $content, scoredAt: $scoredAt, submittedAt: $submittedAt, taskAttachmentUrl: $taskAttachmentUrl, answerAttachmentUrl: $answerAttachmentUrl, score: $score, feedback: $feedback, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$TaskSubmissionDetailCopyWith<$Res>
    implements $TaskSubmissionDetailCopyWith<$Res> {
  factory _$TaskSubmissionDetailCopyWith(_TaskSubmissionDetail value,
          $Res Function(_TaskSubmissionDetail) _then) =
      __$TaskSubmissionDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String content,
      @JsonKey(name: "scored_at") String? scoredAt,
      @JsonKey(name: "submitted_at") String? submittedAt,
      @JsonKey(name: "task_attachment_url") String? taskAttachmentUrl,
      @JsonKey(name: "answer_attachment_url") String? answerAttachmentUrl,
      double? score,
      String? feedback,
      String? answer});
}

/// @nodoc
class __$TaskSubmissionDetailCopyWithImpl<$Res>
    implements _$TaskSubmissionDetailCopyWith<$Res> {
  __$TaskSubmissionDetailCopyWithImpl(this._self, this._then);

  final _TaskSubmissionDetail _self;
  final $Res Function(_TaskSubmissionDetail) _then;

  /// Create a copy of TaskSubmissionDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? scoredAt = freezed,
    Object? submittedAt = freezed,
    Object? taskAttachmentUrl = freezed,
    Object? answerAttachmentUrl = freezed,
    Object? score = freezed,
    Object? feedback = freezed,
    Object? answer = freezed,
  }) {
    return _then(_TaskSubmissionDetail(
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
      scoredAt: freezed == scoredAt
          ? _self.scoredAt
          : scoredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskAttachmentUrl: freezed == taskAttachmentUrl
          ? _self.taskAttachmentUrl
          : taskAttachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAttachmentUrl: freezed == answerAttachmentUrl
          ? _self.answerAttachmentUrl
          : answerAttachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _self.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
