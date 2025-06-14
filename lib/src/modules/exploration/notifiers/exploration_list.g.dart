// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exploration_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$explorationListHash() => r'3948af5f367b5cf4c0ea66fd6aa0664327f748f1';

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

/// See also [explorationList].
@ProviderFor(explorationList)
const explorationListProvider = ExplorationListFamily();

/// See also [explorationList].
class ExplorationListFamily extends Family<AsyncValue<List<Exploration>>> {
  /// See also [explorationList].
  const ExplorationListFamily();

  /// See also [explorationList].
  ExplorationListProvider call({
    int? page,
    int? limit,
  }) {
    return ExplorationListProvider(
      page: page,
      limit: limit,
    );
  }

  @override
  ExplorationListProvider getProviderOverride(
    covariant ExplorationListProvider provider,
  ) {
    return call(
      page: provider.page,
      limit: provider.limit,
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
  String? get name => r'explorationListProvider';
}

/// See also [explorationList].
class ExplorationListProvider
    extends AutoDisposeFutureProvider<List<Exploration>> {
  /// See also [explorationList].
  ExplorationListProvider({
    int? page,
    int? limit,
  }) : this._internal(
          (ref) => explorationList(
            ref as ExplorationListRef,
            page: page,
            limit: limit,
          ),
          from: explorationListProvider,
          name: r'explorationListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$explorationListHash,
          dependencies: ExplorationListFamily._dependencies,
          allTransitiveDependencies:
              ExplorationListFamily._allTransitiveDependencies,
          page: page,
          limit: limit,
        );

  ExplorationListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.limit,
  }) : super.internal();

  final int? page;
  final int? limit;

  @override
  Override overrideWith(
    FutureOr<List<Exploration>> Function(ExplorationListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExplorationListProvider._internal(
        (ref) => create(ref as ExplorationListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Exploration>> createElement() {
    return _ExplorationListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExplorationListProvider &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExplorationListRef on AutoDisposeFutureProviderRef<List<Exploration>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `limit` of this provider.
  int? get limit;
}

class _ExplorationListProviderElement
    extends AutoDisposeFutureProviderElement<List<Exploration>>
    with ExplorationListRef {
  _ExplorationListProviderElement(super.provider);

  @override
  int? get page => (origin as ExplorationListProvider).page;
  @override
  int? get limit => (origin as ExplorationListProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
