import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/constants/auth_state.dart';
import 'package:misterblast_flutter/src/data/user_repository.dart';
import 'package:misterblast_flutter/src/models/user.dart';
import 'package:misterblast_flutter/src/providers/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
Future<User?>? user(Ref ref) async {
  ref.keepAlive();
  final authState = ref.watch(authNotifierProvider);
  try {
    if (authState.valueOrNull == AuthState.loggedIn) {
      return await ref
          .watch(userRepositoryProvider.future)
          .then((userRepository) => userRepository.getMe());
    }
  } catch (e) {
    ref.read(authNotifierProvider.notifier).setAuthState(AuthState.loggedOut);
    return null;
  }

  return null;
}
