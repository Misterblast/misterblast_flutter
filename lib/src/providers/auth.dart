import 'package:misterblast_flutter/src/config/local-storage/shared_preferences.dart';
import 'package:misterblast_flutter/src/constants/auth_state.dart';
import 'package:misterblast_flutter/src/constants/shared_preferences.key.dart';
import 'package:misterblast_flutter/src/providers/user.dart';
import 'package:misterblast_flutter/src/providers/user_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<AuthState> build() {
    checkAuthState();
    return const AsyncValue.loading();
  }

  void checkAuthState() async {
    final sharedPrefs = await ref.watch(sharedPreferencesProvider.future);
    final isLoggedIn = sharedPrefs.getString(
      SharedPreferencesKey.accesToken.name,
    );

    if (isLoggedIn != null && isLoggedIn.isNotEmpty) {
      state = const AsyncValue.data(AuthState.loggedIn);
    } else {
      state = const AsyncValue.data(AuthState.loggedOut);
    }
  }

  void setAuthState(AuthState authState) => state = AsyncValue.data(authState);

  void logout() async {
    final sharedPrefs = await ref.watch(sharedPreferencesProvider.future);
    await sharedPrefs.remove(SharedPreferencesKey.accesToken.name);
    ref.invalidate(userProvider);
    ref.invalidate(userSummaryProvider);
    setAuthState(AuthState.loggedOut);
  }
}
