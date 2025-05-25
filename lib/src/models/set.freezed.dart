// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleSet {
  int get id;
  String get name;
  String get lesson;
  @JsonKey(name: "class")
  String get className;
  @JsonKey(name: 'is_quiz')
  bool get isQuiz;

  /// Create a copy of ExampleSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExampleSetCopyWith<ExampleSet> get copyWith =>
      _$ExampleSetCopyWithImpl<ExampleSet>(this as ExampleSet, _$identity);

  /// Serializes this ExampleSet to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExampleSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.isQuiz, isQuiz) || other.isQuiz == isQuiz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, lesson, className, isQuiz);

  @override
  String toString() {
    return 'ExampleSet(id: $id, name: $name, lesson: $lesson, className: $className, isQuiz: $isQuiz)';
  }
}

/// @nodoc
abstract mixin class $ExampleSetCopyWith<$Res> {
  factory $ExampleSetCopyWith(
          ExampleSet value, $Res Function(ExampleSet) _then) =
      _$ExampleSetCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String lesson,
      @JsonKey(name: "class") String className,
      @JsonKey(name: 'is_quiz') bool isQuiz});
}

/// @nodoc
class _$ExampleSetCopyWithImpl<$Res> implements $ExampleSetCopyWith<$Res> {
  _$ExampleSetCopyWithImpl(this._self, this._then);

  final ExampleSet _self;
  final $Res Function(ExampleSet) _then;

  /// Create a copy of ExampleSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lesson = null,
    Object? className = null,
    Object? isQuiz = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as String,
      className: null == className
          ? _self.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      isQuiz: null == isQuiz
          ? _self.isQuiz
          : isQuiz // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ExampleSet implements ExampleSet {
  const _ExampleSet(
      {required this.id,
      required this.name,
      required this.lesson,
      @JsonKey(name: "class") required this.className,
      @JsonKey(name: 'is_quiz') required this.isQuiz});
  factory _ExampleSet.fromJson(Map<String, dynamic> json) =>
      _$ExampleSetFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String lesson;
  @override
  @JsonKey(name: "class")
  final String className;
  @override
  @JsonKey(name: 'is_quiz')
  final bool isQuiz;

  /// Create a copy of ExampleSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExampleSetCopyWith<_ExampleSet> get copyWith =>
      __$ExampleSetCopyWithImpl<_ExampleSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExampleSetToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExampleSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.isQuiz, isQuiz) || other.isQuiz == isQuiz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, lesson, className, isQuiz);

  @override
  String toString() {
    return 'ExampleSet(id: $id, name: $name, lesson: $lesson, className: $className, isQuiz: $isQuiz)';
  }
}

/// @nodoc
abstract mixin class _$ExampleSetCopyWith<$Res>
    implements $ExampleSetCopyWith<$Res> {
  factory _$ExampleSetCopyWith(
          _ExampleSet value, $Res Function(_ExampleSet) _then) =
      __$ExampleSetCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String lesson,
      @JsonKey(name: "class") String className,
      @JsonKey(name: 'is_quiz') bool isQuiz});
}

/// @nodoc
class __$ExampleSetCopyWithImpl<$Res> implements _$ExampleSetCopyWith<$Res> {
  __$ExampleSetCopyWithImpl(this._self, this._then);

  final _ExampleSet _self;
  final $Res Function(_ExampleSet) _then;

  /// Create a copy of ExampleSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lesson = null,
    Object? className = null,
    Object? isQuiz = null,
  }) {
    return _then(_ExampleSet(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lesson: null == lesson
          ? _self.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as String,
      className: null == className
          ? _self.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      isQuiz: null == isQuiz
          ? _self.isQuiz
          : isQuiz // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
