// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_submission_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizSubmissionNotifierHash() =>
    r'e790acb5a22e8941600f2ff37fe36fc87c66c41e';

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

abstract class _$QuizSubmissionNotifier
    extends BuildlessAutoDisposeNotifier<QuizSubmissionListPaginationState> {
  late final int? subjectId;

  QuizSubmissionListPaginationState build({
    int? subjectId,
  });
}

/// See also [QuizSubmissionNotifier].
@ProviderFor(QuizSubmissionNotifier)
const quizSubmissionNotifierProvider = QuizSubmissionNotifierFamily();

/// See also [QuizSubmissionNotifier].
class QuizSubmissionNotifierFamily
    extends Family<QuizSubmissionListPaginationState> {
  /// See also [QuizSubmissionNotifier].
  const QuizSubmissionNotifierFamily();

  /// See also [QuizSubmissionNotifier].
  QuizSubmissionNotifierProvider call({
    int? subjectId,
  }) {
    return QuizSubmissionNotifierProvider(
      subjectId: subjectId,
    );
  }

  @override
  QuizSubmissionNotifierProvider getProviderOverride(
    covariant QuizSubmissionNotifierProvider provider,
  ) {
    return call(
      subjectId: provider.subjectId,
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
  String? get name => r'quizSubmissionNotifierProvider';
}

/// See also [QuizSubmissionNotifier].
class QuizSubmissionNotifierProvider extends AutoDisposeNotifierProviderImpl<
    QuizSubmissionNotifier, QuizSubmissionListPaginationState> {
  /// See also [QuizSubmissionNotifier].
  QuizSubmissionNotifierProvider({
    int? subjectId,
  }) : this._internal(
          () => QuizSubmissionNotifier()..subjectId = subjectId,
          from: quizSubmissionNotifierProvider,
          name: r'quizSubmissionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizSubmissionNotifierHash,
          dependencies: QuizSubmissionNotifierFamily._dependencies,
          allTransitiveDependencies:
              QuizSubmissionNotifierFamily._allTransitiveDependencies,
          subjectId: subjectId,
        );

  QuizSubmissionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subjectId,
  }) : super.internal();

  final int? subjectId;

  @override
  QuizSubmissionListPaginationState runNotifierBuild(
    covariant QuizSubmissionNotifier notifier,
  ) {
    return notifier.build(
      subjectId: subjectId,
    );
  }

  @override
  Override overrideWith(QuizSubmissionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizSubmissionNotifierProvider._internal(
        () => create()..subjectId = subjectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subjectId: subjectId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<QuizSubmissionNotifier,
      QuizSubmissionListPaginationState> createElement() {
    return _QuizSubmissionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizSubmissionNotifierProvider &&
        other.subjectId == subjectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subjectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuizSubmissionNotifierRef
    on AutoDisposeNotifierProviderRef<QuizSubmissionListPaginationState> {
  /// The parameter `subjectId` of this provider.
  int? get subjectId;
}

class _QuizSubmissionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<QuizSubmissionNotifier,
        QuizSubmissionListPaginationState> with QuizSubmissionNotifierRef {
  _QuizSubmissionNotifierProviderElement(super.provider);

  @override
  int? get subjectId => (origin as QuizSubmissionNotifierProvider).subjectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
