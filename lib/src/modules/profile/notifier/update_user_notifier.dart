import 'package:misterblast_flutter/src/data/user_repository.dart';
import 'package:misterblast_flutter/src/providers/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_user_notifier.g.dart';

@riverpod
class UpdateUserNotifier extends _$UpdateUserNotifier {
  @override
  AsyncValue<bool> build() {
    return const AsyncData(false);
  }

  Future<void> updatePassword(String password) async {
    final repo = await ref.read(userRepositoryProvider.future);
    final userId = ref.read(userProvider).value?.id;
    state = const AsyncLoading();
    try {
      await repo.updatePassword(userId: userId!, newPassword: password);
      state = AsyncData(true);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> updateUser({
    required String userId,
    required String name,
    required String email,
    String? imgUrl,
  }) async {
    final repo = await ref.read(userRepositoryProvider.future);
    state = const AsyncLoading();
    try {
      await repo.updateUser(
        userId: userId,
        name: name,
        email: email,
        filePath: imgUrl,
      );
      state = AsyncData(true);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
