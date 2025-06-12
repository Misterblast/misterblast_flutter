import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/data/user_repository.dart';
import 'package:misterblast_flutter/src/models/user_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_summary.g.dart';

@Riverpod(keepAlive: true)
Future<UserSummary> userSummary(Ref ref) async {
  final userRepository = await ref.watch(userRepositoryProvider.future);
  return userRepository.getUserSummary();
}
