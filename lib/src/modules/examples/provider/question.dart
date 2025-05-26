import 'package:misterblast_flutter/src/modules/examples/data/example_repository.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question.g.dart';

@riverpod
Future<List<Question>> question(Ref ref, String setName) async {
  return await ref.watch(exampleRepositoryProvider).getExamples(setName);
}
