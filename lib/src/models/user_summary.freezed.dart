// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSummary {
  @JsonKey(name: "total_quiz_attempts")
  double get totalQuizAttempts;
  @JsonKey(name: "avg_quiz_score")
  double get averageQuizScore;
  @JsonKey(name: "total_task_attempts")
  double get totalTaskAttempts;
  @JsonKey(name: "avg_task_score")
  double get averageTaskScore;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserSummaryCopyWith<UserSummary> get copyWith =>
      _$UserSummaryCopyWithImpl<UserSummary>(this as UserSummary, _$identity);

  /// Serializes this UserSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserSummary &&
            (identical(other.totalQuizAttempts, totalQuizAttempts) ||
                other.totalQuizAttempts == totalQuizAttempts) &&
            (identical(other.averageQuizScore, averageQuizScore) ||
                other.averageQuizScore == averageQuizScore) &&
            (identical(other.totalTaskAttempts, totalTaskAttempts) ||
                other.totalTaskAttempts == totalTaskAttempts) &&
            (identical(other.averageTaskScore, averageTaskScore) ||
                other.averageTaskScore == averageTaskScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalQuizAttempts,
      averageQuizScore, totalTaskAttempts, averageTaskScore);

  @override
  String toString() {
    return 'UserSummary(totalQuizAttempts: $totalQuizAttempts, averageQuizScore: $averageQuizScore, totalTaskAttempts: $totalTaskAttempts, averageTaskScore: $averageTaskScore)';
  }
}

/// @nodoc
abstract mixin class $UserSummaryCopyWith<$Res> {
  factory $UserSummaryCopyWith(
          UserSummary value, $Res Function(UserSummary) _then) =
      _$UserSummaryCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "total_quiz_attempts") double totalQuizAttempts,
      @JsonKey(name: "avg_quiz_score") double averageQuizScore,
      @JsonKey(name: "total_task_attempts") double totalTaskAttempts,
      @JsonKey(name: "avg_task_score") double averageTaskScore});
}

/// @nodoc
class _$UserSummaryCopyWithImpl<$Res> implements $UserSummaryCopyWith<$Res> {
  _$UserSummaryCopyWithImpl(this._self, this._then);

  final UserSummary _self;
  final $Res Function(UserSummary) _then;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuizAttempts = null,
    Object? averageQuizScore = null,
    Object? totalTaskAttempts = null,
    Object? averageTaskScore = null,
  }) {
    return _then(_self.copyWith(
      totalQuizAttempts: null == totalQuizAttempts
          ? _self.totalQuizAttempts
          : totalQuizAttempts // ignore: cast_nullable_to_non_nullable
              as double,
      averageQuizScore: null == averageQuizScore
          ? _self.averageQuizScore
          : averageQuizScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaskAttempts: null == totalTaskAttempts
          ? _self.totalTaskAttempts
          : totalTaskAttempts // ignore: cast_nullable_to_non_nullable
              as double,
      averageTaskScore: null == averageTaskScore
          ? _self.averageTaskScore
          : averageTaskScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserSummary implements UserSummary {
  const _UserSummary(
      {@JsonKey(name: "total_quiz_attempts") required this.totalQuizAttempts,
      @JsonKey(name: "avg_quiz_score") required this.averageQuizScore,
      @JsonKey(name: "total_task_attempts") required this.totalTaskAttempts,
      @JsonKey(name: "avg_task_score") required this.averageTaskScore});
  factory _UserSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryFromJson(json);

  @override
  @JsonKey(name: "total_quiz_attempts")
  final double totalQuizAttempts;
  @override
  @JsonKey(name: "avg_quiz_score")
  final double averageQuizScore;
  @override
  @JsonKey(name: "total_task_attempts")
  final double totalTaskAttempts;
  @override
  @JsonKey(name: "avg_task_score")
  final double averageTaskScore;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserSummaryCopyWith<_UserSummary> get copyWith =>
      __$UserSummaryCopyWithImpl<_UserSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserSummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSummary &&
            (identical(other.totalQuizAttempts, totalQuizAttempts) ||
                other.totalQuizAttempts == totalQuizAttempts) &&
            (identical(other.averageQuizScore, averageQuizScore) ||
                other.averageQuizScore == averageQuizScore) &&
            (identical(other.totalTaskAttempts, totalTaskAttempts) ||
                other.totalTaskAttempts == totalTaskAttempts) &&
            (identical(other.averageTaskScore, averageTaskScore) ||
                other.averageTaskScore == averageTaskScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalQuizAttempts,
      averageQuizScore, totalTaskAttempts, averageTaskScore);

  @override
  String toString() {
    return 'UserSummary(totalQuizAttempts: $totalQuizAttempts, averageQuizScore: $averageQuizScore, totalTaskAttempts: $totalTaskAttempts, averageTaskScore: $averageTaskScore)';
  }
}

/// @nodoc
abstract mixin class _$UserSummaryCopyWith<$Res>
    implements $UserSummaryCopyWith<$Res> {
  factory _$UserSummaryCopyWith(
          _UserSummary value, $Res Function(_UserSummary) _then) =
      __$UserSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_quiz_attempts") double totalQuizAttempts,
      @JsonKey(name: "avg_quiz_score") double averageQuizScore,
      @JsonKey(name: "total_task_attempts") double totalTaskAttempts,
      @JsonKey(name: "avg_task_score") double averageTaskScore});
}

/// @nodoc
class __$UserSummaryCopyWithImpl<$Res> implements _$UserSummaryCopyWith<$Res> {
  __$UserSummaryCopyWithImpl(this._self, this._then);

  final _UserSummary _self;
  final $Res Function(_UserSummary) _then;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalQuizAttempts = null,
    Object? averageQuizScore = null,
    Object? totalTaskAttempts = null,
    Object? averageTaskScore = null,
  }) {
    return _then(_UserSummary(
      totalQuizAttempts: null == totalQuizAttempts
          ? _self.totalQuizAttempts
          : totalQuizAttempts // ignore: cast_nullable_to_non_nullable
              as double,
      averageQuizScore: null == averageQuizScore
          ? _self.averageQuizScore
          : averageQuizScore // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaskAttempts: null == totalTaskAttempts
          ? _self.totalTaskAttempts
          : totalTaskAttempts // ignore: cast_nullable_to_non_nullable
              as double,
      averageTaskScore: null == averageTaskScore
          ? _self.averageTaskScore
          : averageTaskScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
