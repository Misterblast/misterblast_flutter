import 'package:misterblast_flutter/src/modules/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  void register(
    String name,
    String email,
    String password,
    String? imagePath,
  ) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(authRepositoryProvider).register(
            name,
            email,
            password,
            imagePath,
          );
      state = const AsyncValue.data(true);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
