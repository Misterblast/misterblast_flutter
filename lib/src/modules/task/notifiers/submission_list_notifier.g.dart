// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionListNotifierHash() =>
    r'adf52d580df606306e6338ecaae35eefb0644b85';

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

abstract class _$SubmissionListNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<TaskSubmission>>> {
  late final int? limit;

  AsyncValue<List<TaskSubmission>> build({
    int? limit,
  });
}

/// See also [SubmissionListNotifier].
@ProviderFor(SubmissionListNotifier)
const submissionListNotifierProvider = SubmissionListNotifierFamily();

/// See also [SubmissionListNotifier].
class SubmissionListNotifierFamily
    extends Family<AsyncValue<List<TaskSubmission>>> {
  /// See also [SubmissionListNotifier].
  const SubmissionListNotifierFamily();

  /// See also [SubmissionListNotifier].
  SubmissionListNotifierProvider call({
    int? limit,
  }) {
    return SubmissionListNotifierProvider(
      limit: limit,
    );
  }

  @override
  SubmissionListNotifierProvider getProviderOverride(
    covariant SubmissionListNotifierProvider provider,
  ) {
    return call(
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
  String? get name => r'submissionListNotifierProvider';
}

/// See also [SubmissionListNotifier].
class SubmissionListNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SubmissionListNotifier, AsyncValue<List<TaskSubmission>>> {
  /// See also [SubmissionListNotifier].
  SubmissionListNotifierProvider({
    int? limit,
  }) : this._internal(
          () => SubmissionListNotifier()..limit = limit,
          from: submissionListNotifierProvider,
          name: r'submissionListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionListNotifierHash,
          dependencies: SubmissionListNotifierFamily._dependencies,
          allTransitiveDependencies:
              SubmissionListNotifierFamily._allTransitiveDependencies,
          limit: limit,
        );

  SubmissionListNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int? limit;

  @override
  AsyncValue<List<TaskSubmission>> runNotifierBuild(
    covariant SubmissionListNotifier notifier,
  ) {
    return notifier.build(
      limit: limit,
    );
  }

  @override
  Override overrideWith(SubmissionListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubmissionListNotifierProvider._internal(
        () => create()..limit = limit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SubmissionListNotifier,
      AsyncValue<List<TaskSubmission>>> createElement() {
    return _SubmissionListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionListNotifierProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubmissionListNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<List<TaskSubmission>>> {
  /// The parameter `limit` of this provider.
  int? get limit;
}

class _SubmissionListNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SubmissionListNotifier,
        AsyncValue<List<TaskSubmission>>> with SubmissionListNotifierRef {
  _SubmissionListNotifierProviderElement(super.provider);

  @override
  int? get limit => (origin as SubmissionListNotifierProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
