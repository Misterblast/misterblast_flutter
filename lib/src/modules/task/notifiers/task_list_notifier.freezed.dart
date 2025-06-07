// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskListState {
  int get page;
  int get total;
  String get search;
  List<Task> get tasks;
  String get errorMessage;
  bool get isError;
  bool get isFetchingMore;
  bool get isInitialLoading;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskListStateCopyWith<TaskListState> get copyWith =>
      _$TaskListStateCopyWithImpl<TaskListState>(
          this as TaskListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskListState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isFetchingMore, isFetchingMore) ||
                other.isFetchingMore == isFetchingMore) &&
            (identical(other.isInitialLoading, isInitialLoading) ||
                other.isInitialLoading == isInitialLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      total,
      search,
      const DeepCollectionEquality().hash(tasks),
      errorMessage,
      isError,
      isFetchingMore,
      isInitialLoading);

  @override
  String toString() {
    return 'TaskListState(page: $page, total: $total, search: $search, tasks: $tasks, errorMessage: $errorMessage, isError: $isError, isFetchingMore: $isFetchingMore, isInitialLoading: $isInitialLoading)';
  }
}

/// @nodoc
abstract mixin class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) _then) =
      _$TaskListStateCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      int total,
      String search,
      List<Task> tasks,
      String errorMessage,
      bool isError,
      bool isFetchingMore,
      bool isInitialLoading});
}

/// @nodoc
class _$TaskListStateCopyWithImpl<$Res>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._self, this._then);

  final TaskListState _self;
  final $Res Function(TaskListState) _then;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? total = null,
    Object? search = null,
    Object? tasks = null,
    Object? errorMessage = null,
    Object? isError = null,
    Object? isFetchingMore = null,
    Object? isInitialLoading = null,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isError: null == isError
          ? _self.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingMore: null == isFetchingMore
          ? _self.isFetchingMore
          : isFetchingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitialLoading: null == isInitialLoading
          ? _self.isInitialLoading
          : isInitialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _TaskListState implements TaskListState {
  const _TaskListState(
      {this.page = 1,
      this.total = 0,
      this.search = "",
      final List<Task> tasks = const [],
      this.errorMessage = '',
      this.isError = false,
      this.isFetchingMore = false,
      this.isInitialLoading = false})
      : _tasks = tasks;

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final String search;
  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final bool isFetchingMore;
  @override
  @JsonKey()
  final bool isInitialLoading;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskListStateCopyWith<_TaskListState> get copyWith =>
      __$TaskListStateCopyWithImpl<_TaskListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskListState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isFetchingMore, isFetchingMore) ||
                other.isFetchingMore == isFetchingMore) &&
            (identical(other.isInitialLoading, isInitialLoading) ||
                other.isInitialLoading == isInitialLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      total,
      search,
      const DeepCollectionEquality().hash(_tasks),
      errorMessage,
      isError,
      isFetchingMore,
      isInitialLoading);

  @override
  String toString() {
    return 'TaskListState(page: $page, total: $total, search: $search, tasks: $tasks, errorMessage: $errorMessage, isError: $isError, isFetchingMore: $isFetchingMore, isInitialLoading: $isInitialLoading)';
  }
}

/// @nodoc
abstract mixin class _$TaskListStateCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$TaskListStateCopyWith(
          _TaskListState value, $Res Function(_TaskListState) _then) =
      __$TaskListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int page,
      int total,
      String search,
      List<Task> tasks,
      String errorMessage,
      bool isError,
      bool isFetchingMore,
      bool isInitialLoading});
}

/// @nodoc
class __$TaskListStateCopyWithImpl<$Res>
    implements _$TaskListStateCopyWith<$Res> {
  __$TaskListStateCopyWithImpl(this._self, this._then);

  final _TaskListState _self;
  final $Res Function(_TaskListState) _then;

  /// Create a copy of TaskListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? total = null,
    Object? search = null,
    Object? tasks = null,
    Object? errorMessage = null,
    Object? isError = null,
    Object? isFetchingMore = null,
    Object? isInitialLoading = null,
  }) {
    return _then(_TaskListState(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      search: null == search
          ? _self.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isError: null == isError
          ? _self.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingMore: null == isFetchingMore
          ? _self.isFetchingMore
          : isFetchingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitialLoading: null == isInitialLoading
          ? _self.isInitialLoading
          : isInitialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
