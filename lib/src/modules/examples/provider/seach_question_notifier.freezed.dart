// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seach_question_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchQuestionState {
  int get page;
  int get total;
  List<Question> get questions;
  bool get isInitialLoading;
  bool get isFetchingMore;
  bool get isError;
  String get errorMessage;

  /// Create a copy of SearchQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchQuestionStateCopyWith<SearchQuestionState> get copyWith =>
      _$SearchQuestionStateCopyWithImpl<SearchQuestionState>(
          this as SearchQuestionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchQuestionState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
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
      const DeepCollectionEquality().hash(questions),
      isInitialLoading,
      isFetchingMore,
      isError,
      errorMessage);

  @override
  String toString() {
    return 'SearchQuestionState(page: $page, total: $total, questions: $questions, isInitialLoading: $isInitialLoading, isFetchingMore: $isFetchingMore, isError: $isError, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $SearchQuestionStateCopyWith<$Res> {
  factory $SearchQuestionStateCopyWith(
          SearchQuestionState value, $Res Function(SearchQuestionState) _then) =
      _$SearchQuestionStateCopyWithImpl;
  @useResult
  $Res call(
      {int page,
      int total,
      List<Question> questions,
      bool isInitialLoading,
      bool isFetchingMore,
      bool isError,
      String errorMessage});
}

/// @nodoc
class _$SearchQuestionStateCopyWithImpl<$Res>
    implements $SearchQuestionStateCopyWith<$Res> {
  _$SearchQuestionStateCopyWithImpl(this._self, this._then);

  final SearchQuestionState _self;
  final $Res Function(SearchQuestionState) _then;

  /// Create a copy of SearchQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? total = null,
    Object? questions = null,
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
      questions: null == questions
          ? _self.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
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

class _SearchQuestionState implements SearchQuestionState {
  const _SearchQuestionState(
      {this.page = 1,
      this.total = 0,
      final List<Question> questions = const [],
      this.isInitialLoading = false,
      this.isFetchingMore = false,
      this.isError = false,
      this.errorMessage = ''})
      : _questions = questions;

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  final List<Question> _questions;
  @override
  @JsonKey()
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
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

  /// Create a copy of SearchQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchQuestionStateCopyWith<_SearchQuestionState> get copyWith =>
      __$SearchQuestionStateCopyWithImpl<_SearchQuestionState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchQuestionState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
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
      const DeepCollectionEquality().hash(_questions),
      isInitialLoading,
      isFetchingMore,
      isError,
      errorMessage);

  @override
  String toString() {
    return 'SearchQuestionState(page: $page, total: $total, questions: $questions, isInitialLoading: $isInitialLoading, isFetchingMore: $isFetchingMore, isError: $isError, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$SearchQuestionStateCopyWith<$Res>
    implements $SearchQuestionStateCopyWith<$Res> {
  factory _$SearchQuestionStateCopyWith(_SearchQuestionState value,
          $Res Function(_SearchQuestionState) _then) =
      __$SearchQuestionStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int page,
      int total,
      List<Question> questions,
      bool isInitialLoading,
      bool isFetchingMore,
      bool isError,
      String errorMessage});
}

/// @nodoc
class __$SearchQuestionStateCopyWithImpl<$Res>
    implements _$SearchQuestionStateCopyWith<$Res> {
  __$SearchQuestionStateCopyWithImpl(this._self, this._then);

  final _SearchQuestionState _self;
  final $Res Function(_SearchQuestionState) _then;

  /// Create a copy of SearchQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? total = null,
    Object? questions = null,
    Object? isInitialLoading = null,
    Object? isFetchingMore = null,
    Object? isError = null,
    Object? errorMessage = null,
  }) {
    return _then(_SearchQuestionState(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
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
