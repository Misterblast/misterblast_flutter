import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/logger.dart';

class Logger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.i(
        'Provider added: ${provider.name ?? provider.runtimeType} with value: $value');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    logger.i('Provider disposed: ${provider.name ?? provider.runtimeType}');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    logger.i(
        'Provider updated: ${provider.name ?? provider.runtimeType} from $previousValue to $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    logger.e(
      'Provider failed: ${provider.name ?? provider.runtimeType} with error: $error',
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
