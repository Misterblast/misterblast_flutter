// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_submission_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSubmissionListPaginationState {
  int get page;
  int get total;
  int? get subjectId;
  List<QuizSubmission> get data;
  bool get isInitialLoading;
  bool get isFetchingMore;
  bool get isError;
  String get errorMessage;

  /// Create a copy of QuizSubmissionListPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSubmissionListPaginationStateCopyWith<QuizSubmissionListPaginationState>
      get copyWith => _$QuizSubmissionListPaginationStateCopyWithImpl<
              QuizSubmissionListPaginationState>(
          this as QuizSubmissionListPaginationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSubmissionListPaginationState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.isInitialLoading, isInitialLoading) ||
                other.isInitialLoading == isInitialLoading) &&
            (identical(other.isFetchingMore, isFetchingMore) ||
                other.isFetchingMore == isFetchingMore) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      total,
      subjectId,
      const DeepCollectionEquality().hash(data),
      isInitialLoading,
      isFetchingMore,
      isError,
      errorMessage);

  @override
  String toString() {
    return 'QuizSubmissionListPaginationState(page: $page, total: $total, subjectId: $subjectId, data: $data, isInitialLoading: $isInitialLoading, isFetchingMore: $isFetchingMore, isError: $isError, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $QuizSubmissionListPaginationStateCopyWith<$Res> {
  factory $QuizSubmissionListPaginationStateCopyWith(
          QuizSubmissionListPaginationState value,
          $Res Function(QuizSubmissionListPaginationState) _then) =
      _$QuizSubmissionListPaginationStateCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      int total,
      int? subjectId,
      List<QuizSubmission> data,
      bool isInitialLoading,
      bool isFetchingMore,
      bool isError,
      String errorMessage});
}

/// @nodoc
class _$QuizSubmissionListPaginationStateCopyWithImpl<$Res>
    implements $QuizSubmissionListPaginationStateCopyWith<$Res> {
  _$QuizSubmissionListPaginationStateCopyWithImpl(this._self, this._then);

  final QuizSubmissionListPaginationState _self;
  final $Res Function(QuizSubmissionListPaginationState) _then;

  /// Create a copy of QuizSubmissionListPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? total = null,
    Object? subjectId = freezed,
    Object? data = null,
    Object? isInitialLoading = null,
    Object? isFetchingMore = null,
    Object? isError = null,
    Object? errorMessage = null,
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
      subjectId: freezed == subjectId
          ? _self.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<QuizSubmission>,
      isInitialLoading: null == isInitialLoading
          ? _self.isInitialLoading
          : isInitialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingMore: null == isFetchingMore
          ? _self.isFetchingMore
          : isFetchingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _self.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _QuizSubmissionListPaginationState
    implements QuizSubmissionListPaginationState {
  const _QuizSubmissionListPaginationState(
      {this.page = 1,
      this.total = 0,
      this.subjectId = null,
      final List<QuizSubmission> data = const [],
      this.isInitialLoading = false,
      this.isFetchingMore = false,
      this.isError = false,
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int? subjectId;
  final List<QuizSubmission> _data;
  @override
  @JsonKey()
  List<QuizSubmission> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool isInitialLoading;
  @override
  @JsonKey()
  final bool isFetchingMore;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String errorMessage;

  /// Create a copy of QuizSubmissionListPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSubmissionListPaginationStateCopyWith<
          _QuizSubmissionListPaginationState>
      get copyWith => __$QuizSubmissionListPaginationStateCopyWithImpl<
          _QuizSubmissionListPaginationState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSubmissionListPaginationState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isInitialLoading, isInitialLoading) ||
                other.isInitialLoading == isInitialLoading) &&
            (identical(other.isFetchingMore, isFetchingMore) ||
                other.isFetchingMore == isFetchingMore) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      total,
      subjectId,
      const DeepCollectionEquality().hash(_data),
      isInitialLoading,
      isFetchingMore,
      isError,
      errorMessage);

  @override
  String toString() {
    return 'QuizSubmissionListPaginationState(page: $page, total: $total, subjectId: $subjectId, data: $data, isInitialLoading: $isInitialLoading, isFetchingMore: $isFetchingMore, isError: $isError, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$QuizSubmissionListPaginationStateCopyWith<$Res>
    implements $QuizSubmissionListPaginationStateCopyWith<$Res> {
  factory _$QuizSubmissionListPaginationStateCopyWith(
          _QuizSubmissionListPaginationState value,
          $Res Function(_QuizSubmissionListPaginationState) _then) =
      __$QuizSubmissionListPaginationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int page,
      int total,
      int? subjectId,
      List<QuizSubmission> data,
      bool isInitialLoading,
      bool isFetchingMore,
      bool isError,
      String errorMessage});
}

/// @nodoc
class __$QuizSubmissionListPaginationStateCopyWithImpl<$Res>
    implements _$QuizSubmissionListPaginationStateCopyWith<$Res> {
  __$QuizSubmissionListPaginationStateCopyWithImpl(this._self, this._then);

  final _QuizSubmissionListPaginationState _self;
  final $Res Function(_QuizSubmissionListPaginationState) _then;

  /// Create a copy of QuizSubmissionListPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? total = null,
    Object? subjectId = freezed,
    Object? data = null,
    Object? isInitialLoading = null,
    Object? isFetchingMore = null,
    Object? isError = null,
    Object? errorMessage = null,
  }) {
    return _then(_QuizSubmissionListPaginationState(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subjectId: freezed == subjectId
          ? _self.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<QuizSubmission>,
      isInitialLoading: null == isInitialLoading
          ? _self.isInitialLoading
          : isInitialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingMore: null == isFetchingMore
          ? _self.isFetchingMore
          : isFetchingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _self.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
