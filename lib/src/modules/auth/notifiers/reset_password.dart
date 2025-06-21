import 'package:misterblast_flutter/src/modules/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password.g.dart';

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  resetPassword(String code, String password) async {
    final repo = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    try {
      await repo.resetPassword(code, password);
      state = const AsyncValue.data(true);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
