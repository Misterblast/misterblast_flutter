// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizResultNotifierHash() =>
    r'664393a8d7d4ce79631e9bc7a1d0f38cf0307ab9';

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

abstract class _$QuizResultNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<QuizExplanation?>> {
  late final int? resultId;

  AsyncValue<QuizExplanation?> build(
    int? resultId,
  );
}

/// See also [QuizResultNotifier].
@ProviderFor(QuizResultNotifier)
const quizResultNotifierProvider = QuizResultNotifierFamily();

/// See also [QuizResultNotifier].
class QuizResultNotifierFamily extends Family<AsyncValue<QuizExplanation?>> {
  /// See also [QuizResultNotifier].
  const QuizResultNotifierFamily();

  /// See also [QuizResultNotifier].
  QuizResultNotifierProvider call(
    int? resultId,
  ) {
    return QuizResultNotifierProvider(
      resultId,
    );
  }

  @override
  QuizResultNotifierProvider getProviderOverride(
    covariant QuizResultNotifierProvider provider,
  ) {
    return call(
      provider.resultId,
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
  String? get name => r'quizResultNotifierProvider';
}

/// See also [QuizResultNotifier].
class QuizResultNotifierProvider extends AutoDisposeNotifierProviderImpl<
    QuizResultNotifier, AsyncValue<QuizExplanation?>> {
  /// See also [QuizResultNotifier].
  QuizResultNotifierProvider(
    int? resultId,
  ) : this._internal(
          () => QuizResultNotifier()..resultId = resultId,
          from: quizResultNotifierProvider,
          name: r'quizResultNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizResultNotifierHash,
          dependencies: QuizResultNotifierFamily._dependencies,
          allTransitiveDependencies:
              QuizResultNotifierFamily._allTransitiveDependencies,
          resultId: resultId,
        );

  QuizResultNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.resultId,
  }) : super.internal();

  final int? resultId;

  @override
  AsyncValue<QuizExplanation?> runNotifierBuild(
    covariant QuizResultNotifier notifier,
  ) {
    return notifier.build(
      resultId,
    );
  }

  @override
  Override overrideWith(QuizResultNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizResultNotifierProvider._internal(
        () => create()..resultId = resultId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        resultId: resultId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<QuizResultNotifier,
      AsyncValue<QuizExplanation?>> createElement() {
    return _QuizResultNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizResultNotifierProvider && other.resultId == resultId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, resultId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuizResultNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<QuizExplanation?>> {
  /// The parameter `resultId` of this provider.
  int? get resultId;
}

class _QuizResultNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<QuizResultNotifier,
        AsyncValue<QuizExplanation?>> with QuizResultNotifierRef {
  _QuizResultNotifierProviderElement(super.provider);

  @override
  int? get resultId => (origin as QuizResultNotifierProvider).resultId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
