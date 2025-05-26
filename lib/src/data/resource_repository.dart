import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;
import 'package:misterblast_flutter/src/models/api_response.dart';
import 'package:misterblast_flutter/src/models/class.dart';
import 'package:misterblast_flutter/src/models/lesson.dart';
import 'package:misterblast_flutter/src/models/set.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resource_repository.g.dart';

class ResourceRepository extends BaseRepository {
  ResourceRepository({required super.dio});

  Future<List<Class>> getClasses() async {
    try {
      return await dio.get('class').then(
            (response) => ApiResponse.fromJson(
              response.data,
              (datas) => List<Class>.from(
                (datas as List<dynamic>).map(
                  (data) => Class.fromJson(data as Map<String, dynamic>),
                ),
              ),
            ).data,
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Lesson>> getLessons() async {
    try {
      return await dio.get('lesson').then(
            (response) => ApiResponse.fromJson(
              response.data,
              (datas) => List<Lesson>.from(
                (datas as List<dynamic>).map(
                  (data) => Lesson.fromJson(data as Map<String, dynamic>),
                ),
              ),
            ).data,
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ExampleSet>> getSets(String lessonName, String className) async {
    try {
      return await dio.get(
        'set',
        queryParameters: {
          'lesson': lessonName,
          'class': className,
          "is_quiz": false
        },
      ).then(
        (response) => ApiResponse.fromJson(
          response.data,
          (datas) => List<ExampleSet>.from(
            (datas as List<dynamic>).map(
              (data) => ExampleSet.fromJson(data as Map<String, dynamic>),
            ),
          ),
        ).data,
      );
    } catch (e) {
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
Future<ResourceRepository> resourceRepository(Ref ref) async {
  ref.keepAlive();
  return ResourceRepository(dio: await ref.watch(dioProvider.future));
}
