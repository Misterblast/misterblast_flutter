// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exploration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Exploration {
  int get id;
  String? get title;
  String? get desc;
  String? get lang;
  @JsonKey(name: "img_url")
  String? get imgUrl;
  @JsonKey(name: "site_url")
  String? get siteUrl;

  /// Create a copy of Exploration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExplorationCopyWith<Exploration> get copyWith =>
      _$ExplorationCopyWithImpl<Exploration>(this as Exploration, _$identity);

  /// Serializes this Exploration to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Exploration &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, desc, lang, imgUrl, siteUrl);

  @override
  String toString() {
    return 'Exploration(id: $id, title: $title, desc: $desc, lang: $lang, imgUrl: $imgUrl, siteUrl: $siteUrl)';
  }
}

/// @nodoc
abstract mixin class $ExplorationCopyWith<$Res> {
  factory $ExplorationCopyWith(
          Exploration value, $Res Function(Exploration) _then) =
      _$ExplorationCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? title,
      String? desc,
      String? lang,
      @JsonKey(name: "img_url") String? imgUrl,
      @JsonKey(name: "site_url") String? siteUrl});
}

/// @nodoc
class _$ExplorationCopyWithImpl<$Res> implements $ExplorationCopyWith<$Res> {
  _$ExplorationCopyWithImpl(this._self, this._then);

  final Exploration _self;
  final $Res Function(Exploration) _then;

  /// Create a copy of Exploration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? desc = freezed,
    Object? lang = freezed,
    Object? imgUrl = freezed,
    Object? siteUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _self.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _self.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Exploration implements Exploration {
  const _Exploration(
      {required this.id,
      this.title,
      this.desc,
      this.lang,
      @JsonKey(name: "img_url") this.imgUrl,
      @JsonKey(name: "site_url") this.siteUrl});
  factory _Exploration.fromJson(Map<String, dynamic> json) =>
      _$ExplorationFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? desc;
  @override
  final String? lang;
  @override
  @JsonKey(name: "img_url")
  final String? imgUrl;
  @override
  @JsonKey(name: "site_url")
  final String? siteUrl;

  /// Create a copy of Exploration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExplorationCopyWith<_Exploration> get copyWith =>
      __$ExplorationCopyWithImpl<_Exploration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExplorationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Exploration &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, desc, lang, imgUrl, siteUrl);

  @override
  String toString() {
    return 'Exploration(id: $id, title: $title, desc: $desc, lang: $lang, imgUrl: $imgUrl, siteUrl: $siteUrl)';
  }
}

/// @nodoc
abstract mixin class _$ExplorationCopyWith<$Res>
    implements $ExplorationCopyWith<$Res> {
  factory _$ExplorationCopyWith(
          _Exploration value, $Res Function(_Exploration) _then) =
      __$ExplorationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? title,
      String? desc,
      String? lang,
      @JsonKey(name: "img_url") String? imgUrl,
      @JsonKey(name: "site_url") String? siteUrl});
}

/// @nodoc
class __$ExplorationCopyWithImpl<$Res> implements _$ExplorationCopyWith<$Res> {
  __$ExplorationCopyWithImpl(this._self, this._then);

  final _Exploration _self;
  final $Res Function(_Exploration) _then;

  /// Create a copy of Exploration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? desc = freezed,
    Object? lang = freezed,
    Object? imgUrl = freezed,
    Object? siteUrl = freezed,
  }) {
    return _then(_Exploration(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _self.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _self.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
