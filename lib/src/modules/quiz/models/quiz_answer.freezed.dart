// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizAnswer {
  int get id;
  String get code;
  String get content;
  @JsonKey(name: "img_url")
  String? get imageUrl;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizAnswerCopyWith<QuizAnswer> get copyWith =>
      _$QuizAnswerCopyWithImpl<QuizAnswer>(this as QuizAnswer, _$identity);

  /// Serializes this QuizAnswer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizAnswer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, content, imageUrl);

  @override
  String toString() {
    return 'QuizAnswer(id: $id, code: $code, content: $content, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $QuizAnswerCopyWith<$Res> {
  factory $QuizAnswerCopyWith(
          QuizAnswer value, $Res Function(QuizAnswer) _then) =
      _$QuizAnswerCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String code,
      String content,
      @JsonKey(name: "img_url") String? imageUrl});
}

/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res> implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._self, this._then);

  final QuizAnswer _self;
  final $Res Function(QuizAnswer) _then;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? content = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuizAnswer implements QuizAnswer {
  const _QuizAnswer(
      {required this.id,
      required this.code,
      required this.content,
      @JsonKey(name: "img_url") this.imageUrl});
  factory _QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String content;
  @override
  @JsonKey(name: "img_url")
  final String? imageUrl;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizAnswerCopyWith<_QuizAnswer> get copyWith =>
      __$QuizAnswerCopyWithImpl<_QuizAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizAnswerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizAnswer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, content, imageUrl);

  @override
  String toString() {
    return 'QuizAnswer(id: $id, code: $code, content: $content, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$QuizAnswerCopyWith<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  factory _$QuizAnswerCopyWith(
          _QuizAnswer value, $Res Function(_QuizAnswer) _then) =
      __$QuizAnswerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      String content,
      @JsonKey(name: "img_url") String? imageUrl});
}

/// @nodoc
class __$QuizAnswerCopyWithImpl<$Res> implements _$QuizAnswerCopyWith<$Res> {
  __$QuizAnswerCopyWithImpl(this._self, this._then);

  final _QuizAnswer _self;
  final $Res Function(_QuizAnswer) _then;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? content = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_QuizAnswer(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
