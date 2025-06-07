// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListNotifierHash() => r'fce1ede3b0637afacd32d5fcee806c8a5b9dd0f6';

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

abstract class _$TaskListNotifier
    extends BuildlessAutoDisposeNotifier<TaskListState> {
  late final int? page;
  late final int? limit;

  TaskListState build({
    int? page = 1,
    int? limit = 10,
  });
}

/// See also [TaskListNotifier].
@ProviderFor(TaskListNotifier)
const taskListNotifierProvider = TaskListNotifierFamily();

/// See also [TaskListNotifier].
class TaskListNotifierFamily extends Family<TaskListState> {
  /// See also [TaskListNotifier].
  const TaskListNotifierFamily();

  /// See also [TaskListNotifier].
  TaskListNotifierProvider call({
    int? page = 1,
    int? limit = 10,
  }) {
    return TaskListNotifierProvider(
      page: page,
      limit: limit,
    );
  }

  @override
  TaskListNotifierProvider getProviderOverride(
    covariant TaskListNotifierProvider provider,
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
  String? get name => r'taskListNotifierProvider';
}

/// See also [TaskListNotifier].
class TaskListNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TaskListNotifier, TaskListState> {
  /// See also [TaskListNotifier].
  TaskListNotifierProvider({
    int? page = 1,
    int? limit = 10,
  }) : this._internal(
          () => TaskListNotifier()
            ..page = page
            ..limit = limit,
          from: taskListNotifierProvider,
          name: r'taskListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskListNotifierHash,
          dependencies: TaskListNotifierFamily._dependencies,
          allTransitiveDependencies:
              TaskListNotifierFamily._allTransitiveDependencies,
          page: page,
          limit: limit,
        );

  TaskListNotifierProvider._internal(
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
  TaskListState runNotifierBuild(
    covariant TaskListNotifier notifier,
  ) {
    return notifier.build(
      page: page,
      limit: limit,
    );
  }

  @override
  Override overrideWith(TaskListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskListNotifierProvider._internal(
        () => create()
          ..page = page
          ..limit = limit,
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
  AutoDisposeNotifierProviderElement<TaskListNotifier, TaskListState>
      createElement() {
    return _TaskListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskListNotifierProvider &&
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
mixin TaskListNotifierRef on AutoDisposeNotifierProviderRef<TaskListState> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `limit` of this provider.
  int? get limit;
}

class _TaskListNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TaskListNotifier, TaskListState>
    with TaskListNotifierRef {
  _TaskListNotifierProviderElement(super.provider);

  @override
  int? get page => (origin as TaskListNotifierProvider).page;
  @override
  int? get limit => (origin as TaskListNotifierProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
