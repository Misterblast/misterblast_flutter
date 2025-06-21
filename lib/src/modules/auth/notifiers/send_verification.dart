import 'package:misterblast_flutter/src/modules/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_verification.g.dart';

@riverpod
class SendVerification extends _$SendVerification {
  late AuthRepository authRepository;

  @override
  AsyncValue<String?> build() {
    authRepository = ref.read(authRepositoryProvider);
    return const AsyncValue.data(null);
  }

  Future<void> sendVerificationEmail(String email) async {
    state = const AsyncValue.loading();
    try {
      await authRepository.sendVerificationEmail(email);
      state = AsyncValue.data(email);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> resendEmail() async {
    if (state.value == null) {
      state = AsyncValue.error('No email to resend', StackTrace.current);
      return;
    }
    String email = state.value!;
    state = const AsyncValue.loading();
    try {
      await authRepository.sendVerificationEmail(email);
      state = AsyncValue.data(state.value);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
