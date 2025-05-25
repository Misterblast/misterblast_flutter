import 'package:misterblast_flutter/src/config/local-storage/shared_preferences.dart';
import 'package:misterblast_flutter/src/constants/auth_state.dart';
import 'package:misterblast_flutter/src/constants/shared_preferences.key.dart';
import 'package:misterblast_flutter/src/modules/auth/data/auth_repository.dart';
import 'package:misterblast_flutter/src/providers/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<String> build() => const AsyncValue.data('');

  void login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final sharedPrefs = await ref.watch(sharedPreferencesProvider.future);
      final token =
          await ref.read(authRepositoryProvider).login(email, password);
      ref.read(authNotifierProvider.notifier).setAuthState(AuthState.loggedIn);
      sharedPrefs.setString(
        SharedPreferencesKey.accesToken.name,
        token,
      );
      state = AsyncValue.data(token);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
