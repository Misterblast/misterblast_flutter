// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:misterblast_flutter/src/modules/exploration/data/exploration_repo.dart';
import 'package:misterblast_flutter/src/modules/exploration/models/exploration.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exploration_list.g.dart';

@riverpod
Future<List<Exploration>> explorationList(
  Ref ref, {
  int? page,
  int? limit,
}) async {
  final repo = await ref.watch(explorationRepositoryProvider.future);
  return await repo
      .fetchExplorations(page: page, limit: limit)
      .then((value) => value.data);
}
