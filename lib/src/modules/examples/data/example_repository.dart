import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;
import 'package:misterblast_flutter/src/models/api_response.dart';
import 'package:misterblast_flutter/src/models/paginated_response.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example_repository.g.dart';

class ExampleRepository extends BaseRepository {
  ExampleRepository({required super.dio});

  Future<List<Question>> getExamples(String setName) async {
    try {
      return await dio.get(
        'admin-question',
        queryParameters: {"set": setName, "limit": 1000},
      ).then(
        (response) => ApiResponse.fromJson(
          response.data,
          (data) => PaginatedResponse.fromJson(
            data as Map<String, dynamic>,
            (json) => Question.fromJson(json as Map<String, dynamic>),
          ),
        ).data.data,
      );
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
ExampleRepository exampleRepository(Ref ref) =>
    ExampleRepository(dio: ref.watch(dioProvider).requireValue);
