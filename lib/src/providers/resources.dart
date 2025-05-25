import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/data/resource_repository.dart';
import 'package:misterblast_flutter/src/models/class.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/models/set.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resources.g.dart';

@Riverpod(keepAlive: true)
Future<List<Class>> classes(Ref ref) async {
  ref.keepAlive();
  return await ref
      .watch(resourceRepositoryProvider.future)
      .then((repo) => repo.getClasses());
}

@Riverpod(keepAlive: true)
Future<List<Lesson>> lessons(Ref ref) async {
  ref.keepAlive();
  return await ref
      .watch(resourceRepositoryProvider.future)
      .then((repo) => repo.getLessons());
}

@riverpod
Future<List<ExampleSet>> exampleSets(
  Ref ref, {
  required String lessonName,
  required String className,
}) async {
  return await ref
      .watch(resourceRepositoryProvider.future)
      .then((repo) => repo.getSets(lessonName, className));
}
