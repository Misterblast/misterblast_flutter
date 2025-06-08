// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskDetailNotifierHash() =>
    r'b5c84ed5c551c24bf1b06616e99edfc2fe75d2f6';

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

abstract class _$TaskDetailNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<TaskDetail>> {
  late final int taskId;

  AsyncValue<TaskDetail> build(
    int taskId,
  );
}

/// See also [TaskDetailNotifier].
@ProviderFor(TaskDetailNotifier)
const taskDetailNotifierProvider = TaskDetailNotifierFamily();

/// See also [TaskDetailNotifier].
class TaskDetailNotifierFamily extends Family<AsyncValue<TaskDetail>> {
  /// See also [TaskDetailNotifier].
  const TaskDetailNotifierFamily();

  /// See also [TaskDetailNotifier].
  TaskDetailNotifierProvider call(
    int taskId,
  ) {
    return TaskDetailNotifierProvider(
      taskId,
    );
  }

  @override
  TaskDetailNotifierProvider getProviderOverride(
    covariant TaskDetailNotifierProvider provider,
  ) {
    return call(
      provider.taskId,
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
  String? get name => r'taskDetailNotifierProvider';
}

/// See also [TaskDetailNotifier].
class TaskDetailNotifierProvider extends AutoDisposeNotifierProviderImpl<
    TaskDetailNotifier, AsyncValue<TaskDetail>> {
  /// See also [TaskDetailNotifier].
  TaskDetailNotifierProvider(
    int taskId,
  ) : this._internal(
          () => TaskDetailNotifier()..taskId = taskId,
          from: taskDetailNotifierProvider,
          name: r'taskDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskDetailNotifierHash,
          dependencies: TaskDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              TaskDetailNotifierFamily._allTransitiveDependencies,
          taskId: taskId,
        );

  TaskDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final int taskId;

  @override
  AsyncValue<TaskDetail> runNotifierBuild(
    covariant TaskDetailNotifier notifier,
  ) {
    return notifier.build(
      taskId,
    );
  }

  @override
  Override overrideWith(TaskDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskDetailNotifierProvider._internal(
        () => create()..taskId = taskId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TaskDetailNotifier, AsyncValue<TaskDetail>>
      createElement() {
    return _TaskDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskDetailNotifierProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaskDetailNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<TaskDetail>> {
  /// The parameter `taskId` of this provider.
  int get taskId;
}

class _TaskDetailNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TaskDetailNotifier,
        AsyncValue<TaskDetail>> with TaskDetailNotifierRef {
  _TaskDetailNotifierProviderElement(super.provider);

  @override
  int get taskId => (origin as TaskDetailNotifierProvider).taskId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
