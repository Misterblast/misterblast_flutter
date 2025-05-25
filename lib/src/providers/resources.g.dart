// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$classesHash() => r'3398406545d398fd4eb7a85b7c3d07b4653f53cc';

/// See also [classes].
@ProviderFor(classes)
final classesProvider = FutureProvider<List<Class>>.internal(
  classes,
  name: r'classesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$classesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClassesRef = FutureProviderRef<List<Class>>;
String _$lessonsHash() => r'04f20fe5e941a31a86da597c616cf0e89574d3ff';

/// See also [lessons].
@ProviderFor(lessons)
final lessonsProvider = FutureProvider<List<Lesson>>.internal(
  lessons,
  name: r'lessonsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lessonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LessonsRef = FutureProviderRef<List<Lesson>>;
String _$exampleSetsHash() => r'bd6128892d13e1917d601b0f25f72d8b7b11bef7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [exampleSets].
@ProviderFor(exampleSets)
const exampleSetsProvider = ExampleSetsFamily();

/// See also [exampleSets].
class ExampleSetsFamily extends Family<AsyncValue<List<ExampleSet>>> {
  /// See also [exampleSets].
  const ExampleSetsFamily();

  /// See also [exampleSets].
  ExampleSetsProvider call({
    required String lessonName,
    required String className,
  }) {
    return ExampleSetsProvider(
      lessonName: lessonName,
      className: className,
    );
  }

  @override
  ExampleSetsProvider getProviderOverride(
    covariant ExampleSetsProvider provider,
  ) {
    return call(
      lessonName: provider.lessonName,
      className: provider.className,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exampleSetsProvider';
}

/// See also [exampleSets].
class ExampleSetsProvider extends AutoDisposeFutureProvider<List<ExampleSet>> {
  /// See also [exampleSets].
  ExampleSetsProvider({
    required String lessonName,
    required String className,
  }) : this._internal(
          (ref) => exampleSets(
            ref as ExampleSetsRef,
            lessonName: lessonName,
            className: className,
          ),
          from: exampleSetsProvider,
          name: r'exampleSetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exampleSetsHash,
          dependencies: ExampleSetsFamily._dependencies,
          allTransitiveDependencies:
              ExampleSetsFamily._allTransitiveDependencies,
          lessonName: lessonName,
          className: className,
        );

  ExampleSetsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lessonName,
    required this.className,
  }) : super.internal();

  final String lessonName;
  final String className;

  @override
  Override overrideWith(
    FutureOr<List<ExampleSet>> Function(ExampleSetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExampleSetsProvider._internal(
        (ref) => create(ref as ExampleSetsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lessonName: lessonName,
        className: className,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ExampleSet>> createElement() {
    return _ExampleSetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExampleSetsProvider &&
        other.lessonName == lessonName &&
        other.className == className;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lessonName.hashCode);
    hash = _SystemHash.combine(hash, className.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExampleSetsRef on AutoDisposeFutureProviderRef<List<ExampleSet>> {
  /// The parameter `lessonName` of this provider.
  String get lessonName;

  /// The parameter `className` of this provider.
  String get className;
}

class _ExampleSetsProviderElement
    extends AutoDisposeFutureProviderElement<List<ExampleSet>>
    with ExampleSetsRef {
  _ExampleSetsProviderElement(super.provider);

  @override
  String get lessonName => (origin as ExampleSetsProvider).lessonName;
  @override
  String get className => (origin as ExampleSetsProvider).className;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
