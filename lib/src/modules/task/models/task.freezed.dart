// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {
  int? get id;
  String? get title;
  String? get content;
  String? get description;
  @JsonKey(name: "last_updated_at")
  String? get lastUpdatedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskCopyWith<Task> get copyWith =>
      _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, description, lastUpdatedAt);

  @override
  String toString() {
    return 'Task(id: $id, title: $title, content: $content, description: $description, lastUpdatedAt: $lastUpdatedAt)';
  }
}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) =
      _$TaskCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? description,
      @JsonKey(name: "last_updated_at") String? lastUpdatedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? description = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _self.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Task implements Task {
  const _Task(
      {this.id,
      this.title,
      this.content,
      this.description,
      @JsonKey(name: "last_updated_at") this.lastUpdatedAt});
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? description;
  @override
  @JsonKey(name: "last_updated_at")
  final String? lastUpdatedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, description, lastUpdatedAt);

  @override
  String toString() {
    return 'Task(id: $id, title: $title, content: $content, description: $description, lastUpdatedAt: $lastUpdatedAt)';
  }
}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) =
      __$TaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? description,
      @JsonKey(name: "last_updated_at") String? lastUpdatedAt});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? description = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_Task(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _self.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$TaskDetail {
  int? get id;
  String? get title;
  String? get content;
  String? get description;
  @JsonKey(name: "last_updated_at")
  String? get lastUpdatedAt;
  @JsonKey(name: "attached_url")
  String? get attachedUrl;

  /// Create a copy of TaskDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskDetailCopyWith<TaskDetail> get copyWith =>
      _$TaskDetailCopyWithImpl<TaskDetail>(this as TaskDetail, _$identity);

  /// Serializes this TaskDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.attachedUrl, attachedUrl) ||
                other.attachedUrl == attachedUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, description, lastUpdatedAt, attachedUrl);

  @override
  String toString() {
    return 'TaskDetail(id: $id, title: $title, content: $content, description: $description, lastUpdatedAt: $lastUpdatedAt, attachedUrl: $attachedUrl)';
  }
}

/// @nodoc
abstract mixin class $TaskDetailCopyWith<$Res> {
  factory $TaskDetailCopyWith(
          TaskDetail value, $Res Function(TaskDetail) _then) =
      _$TaskDetailCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? description,
      @JsonKey(name: "last_updated_at") String? lastUpdatedAt,
      @JsonKey(name: "attached_url") String? attachedUrl});
}

/// @nodoc
class _$TaskDetailCopyWithImpl<$Res> implements $TaskDetailCopyWith<$Res> {
  _$TaskDetailCopyWithImpl(this._self, this._then);

  final TaskDetail _self;
  final $Res Function(TaskDetail) _then;

  /// Create a copy of TaskDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? description = freezed,
    Object? lastUpdatedAt = freezed,
    Object? attachedUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _self.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      attachedUrl: freezed == attachedUrl
          ? _self.attachedUrl
          : attachedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TaskDetail implements TaskDetail {
  const _TaskDetail(
      {this.id,
      this.title,
      this.content,
      this.description,
      @JsonKey(name: "last_updated_at") this.lastUpdatedAt,
      @JsonKey(name: "attached_url") this.attachedUrl});
  factory _TaskDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? description;
  @override
  @JsonKey(name: "last_updated_at")
  final String? lastUpdatedAt;
  @override
  @JsonKey(name: "attached_url")
  final String? attachedUrl;

  /// Create a copy of TaskDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskDetailCopyWith<_TaskDetail> get copyWith =>
      __$TaskDetailCopyWithImpl<_TaskDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.attachedUrl, attachedUrl) ||
                other.attachedUrl == attachedUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, description, lastUpdatedAt, attachedUrl);

  @override
  String toString() {
    return 'TaskDetail(id: $id, title: $title, content: $content, description: $description, lastUpdatedAt: $lastUpdatedAt, attachedUrl: $attachedUrl)';
  }
}

/// @nodoc
abstract mixin class _$TaskDetailCopyWith<$Res>
    implements $TaskDetailCopyWith<$Res> {
  factory _$TaskDetailCopyWith(
          _TaskDetail value, $Res Function(_TaskDetail) _then) =
      __$TaskDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      String? description,
      @JsonKey(name: "last_updated_at") String? lastUpdatedAt,
      @JsonKey(name: "attached_url") String? attachedUrl});
}

/// @nodoc
class __$TaskDetailCopyWithImpl<$Res> implements _$TaskDetailCopyWith<$Res> {
  __$TaskDetailCopyWithImpl(this._self, this._then);

  final _TaskDetail _self;
  final $Res Function(_TaskDetail) _then;

  /// Create a copy of TaskDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? description = freezed,
    Object? lastUpdatedAt = freezed,
    Object? attachedUrl = freezed,
  }) {
    return _then(_TaskDetail(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _self.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      attachedUrl: freezed == attachedUrl
          ? _self.attachedUrl
          : attachedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
