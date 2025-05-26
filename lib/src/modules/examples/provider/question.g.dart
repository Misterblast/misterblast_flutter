// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionHash() => r'73c33e65967b59089da4fc188912640da8bccae2';

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

/// See also [question].
@ProviderFor(question)
const questionProvider = QuestionFamily();

/// See also [question].
class QuestionFamily extends Family<AsyncValue<List<Question>>> {
  /// See also [question].
  const QuestionFamily();

  /// See also [question].
  QuestionProvider call(
    String setName,
  ) {
    return QuestionProvider(
      setName,
    );
  }

  @override
  QuestionProvider getProviderOverride(
    covariant QuestionProvider provider,
  ) {
    return call(
      provider.setName,
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
  String? get name => r'questionProvider';
}

/// See also [question].
class QuestionProvider extends AutoDisposeFutureProvider<List<Question>> {
  /// See also [question].
  QuestionProvider(
    String setName,
  ) : this._internal(
          (ref) => question(
            ref as QuestionRef,
            setName,
          ),
          from: questionProvider,
          name: r'questionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionHash,
          dependencies: QuestionFamily._dependencies,
          allTransitiveDependencies: QuestionFamily._allTransitiveDependencies,
          setName: setName,
        );

  QuestionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.setName,
  }) : super.internal();

  final String setName;

  @override
  Override overrideWith(
    FutureOr<List<Question>> Function(QuestionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionProvider._internal(
        (ref) => create(ref as QuestionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        setName: setName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Question>> createElement() {
    return _QuestionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionProvider && other.setName == setName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, setName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuestionRef on AutoDisposeFutureProviderRef<List<Question>> {
  /// The parameter `setName` of this provider.
  String get setName;
}

class _QuestionProviderElement
    extends AutoDisposeFutureProviderElement<List<Question>> with QuestionRef {
  _QuestionProviderElement(super.provider);

  @override
  String get setName => (origin as QuestionProvider).setName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
