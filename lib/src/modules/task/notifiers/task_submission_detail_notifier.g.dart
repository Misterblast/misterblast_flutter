// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_submission_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskSubmissionDetailHash() =>
    r'960840013fe97e64744f749677284b388d8f029b';

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

/// See also [taskSubmissionDetail].
@ProviderFor(taskSubmissionDetail)
const taskSubmissionDetailProvider = TaskSubmissionDetailFamily();

/// See also [taskSubmissionDetail].
class TaskSubmissionDetailFamily
    extends Family<AsyncValue<TaskSubmissionDetail>> {
  /// See also [taskSubmissionDetail].
  const TaskSubmissionDetailFamily();

  /// See also [taskSubmissionDetail].
  TaskSubmissionDetailProvider call(
    int submissionId,
  ) {
    return TaskSubmissionDetailProvider(
      submissionId,
    );
  }

  @override
  TaskSubmissionDetailProvider getProviderOverride(
    covariant TaskSubmissionDetailProvider provider,
  ) {
    return call(
      provider.submissionId,
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
  String? get name => r'taskSubmissionDetailProvider';
}

/// See also [taskSubmissionDetail].
class TaskSubmissionDetailProvider
    extends AutoDisposeFutureProvider<TaskSubmissionDetail> {
  /// See also [taskSubmissionDetail].
  TaskSubmissionDetailProvider(
    int submissionId,
  ) : this._internal(
          (ref) => taskSubmissionDetail(
            ref as TaskSubmissionDetailRef,
            submissionId,
          ),
          from: taskSubmissionDetailProvider,
          name: r'taskSubmissionDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskSubmissionDetailHash,
          dependencies: TaskSubmissionDetailFamily._dependencies,
          allTransitiveDependencies:
              TaskSubmissionDetailFamily._allTransitiveDependencies,
          submissionId: submissionId,
        );

  TaskSubmissionDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.submissionId,
  }) : super.internal();

  final int submissionId;

  @override
  Override overrideWith(
    FutureOr<TaskSubmissionDetail> Function(TaskSubmissionDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaskSubmissionDetailProvider._internal(
        (ref) => create(ref as TaskSubmissionDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        submissionId: submissionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TaskSubmissionDetail> createElement() {
    return _TaskSubmissionDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskSubmissionDetailProvider &&
        other.submissionId == submissionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, submissionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaskSubmissionDetailRef
    on AutoDisposeFutureProviderRef<TaskSubmissionDetail> {
  /// The parameter `submissionId` of this provider.
  int get submissionId;
}

class _TaskSubmissionDetailProviderElement
    extends AutoDisposeFutureProviderElement<TaskSubmissionDetail>
    with TaskSubmissionDetailRef {
  _TaskSubmissionDetailProviderElement(super.provider);

  @override
  int get submissionId => (origin as TaskSubmissionDetailProvider).submissionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
