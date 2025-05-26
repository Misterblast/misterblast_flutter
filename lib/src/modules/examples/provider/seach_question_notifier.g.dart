// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seach_question_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchQuestionNotifierHash() =>
    r'a87fd4244c930696aef1dfa441c3802e60b664c3';

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

abstract class _$SearchQuestionNotifier
    extends BuildlessAutoDisposeNotifier<SearchQuestionState> {
  late final String? search;
  late final String? className;
  late final String? subjectName;
  late final String? subjectCode;

  SearchQuestionState build({
    String? search,
    String? className,
    String? subjectName,
    String? subjectCode,
  });
}

/// See also [SearchQuestionNotifier].
@ProviderFor(SearchQuestionNotifier)
const searchQuestionNotifierProvider = SearchQuestionNotifierFamily();

/// See also [SearchQuestionNotifier].
class SearchQuestionNotifierFamily extends Family<SearchQuestionState> {
  /// See also [SearchQuestionNotifier].
  const SearchQuestionNotifierFamily();

  /// See also [SearchQuestionNotifier].
  SearchQuestionNotifierProvider call({
    String? search,
    String? className,
    String? subjectName,
    String? subjectCode,
  }) {
    return SearchQuestionNotifierProvider(
      search: search,
      className: className,
      subjectName: subjectName,
      subjectCode: subjectCode,
    );
  }

  @override
  SearchQuestionNotifierProvider getProviderOverride(
    covariant SearchQuestionNotifierProvider provider,
  ) {
    return call(
      search: provider.search,
      className: provider.className,
      subjectName: provider.subjectName,
      subjectCode: provider.subjectCode,
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
  String? get name => r'searchQuestionNotifierProvider';
}

/// See also [SearchQuestionNotifier].
class SearchQuestionNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SearchQuestionNotifier, SearchQuestionState> {
  /// See also [SearchQuestionNotifier].
  SearchQuestionNotifierProvider({
    String? search,
    String? className,
    String? subjectName,
    String? subjectCode,
  }) : this._internal(
          () => SearchQuestionNotifier()
            ..search = search
            ..className = className
            ..subjectName = subjectName
            ..subjectCode = subjectCode,
          from: searchQuestionNotifierProvider,
          name: r'searchQuestionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchQuestionNotifierHash,
          dependencies: SearchQuestionNotifierFamily._dependencies,
          allTransitiveDependencies:
              SearchQuestionNotifierFamily._allTransitiveDependencies,
          search: search,
          className: className,
          subjectName: subjectName,
          subjectCode: subjectCode,
        );

  SearchQuestionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.className,
    required this.subjectName,
    required this.subjectCode,
  }) : super.internal();

  final String? search;
  final String? className;
  final String? subjectName;
  final String? subjectCode;

  @override
  SearchQuestionState runNotifierBuild(
    covariant SearchQuestionNotifier notifier,
  ) {
    return notifier.build(
      search: search,
      className: className,
      subjectName: subjectName,
      subjectCode: subjectCode,
    );
  }

  @override
  Override overrideWith(SearchQuestionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchQuestionNotifierProvider._internal(
        () => create()
          ..search = search
          ..className = className
          ..subjectName = subjectName
          ..subjectCode = subjectCode,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        className: className,
        subjectName: subjectName,
        subjectCode: subjectCode,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SearchQuestionNotifier,
      SearchQuestionState> createElement() {
    return _SearchQuestionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchQuestionNotifierProvider &&
        other.search == search &&
        other.className == className &&
        other.subjectName == subjectName &&
        other.subjectCode == subjectCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, className.hashCode);
    hash = _SystemHash.combine(hash, subjectName.hashCode);
    hash = _SystemHash.combine(hash, subjectCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchQuestionNotifierRef
    on AutoDisposeNotifierProviderRef<SearchQuestionState> {
  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `className` of this provider.
  String? get className;

  /// The parameter `subjectName` of this provider.
  String? get subjectName;

  /// The parameter `subjectCode` of this provider.
  String? get subjectCode;
}

class _SearchQuestionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SearchQuestionNotifier,
        SearchQuestionState> with SearchQuestionNotifierRef {
  _SearchQuestionNotifierProviderElement(super.provider);

  @override
  String? get search => (origin as SearchQuestionNotifierProvider).search;
  @override
  String? get className => (origin as SearchQuestionNotifierProvider).className;
  @override
  String? get subjectName =>
      (origin as SearchQuestionNotifierProvider).subjectName;
  @override
  String? get subjectCode =>
      (origin as SearchQuestionNotifierProvider).subjectCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
