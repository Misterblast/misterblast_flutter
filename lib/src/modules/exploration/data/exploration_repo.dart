import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;

import 'package:misterblast_flutter/src/models/api_response.dart';
import 'package:misterblast_flutter/src/models/paginated_response.dart';
import 'package:misterblast_flutter/src/modules/exploration/models/exploration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exploration_repo.g.dart';

class ExplorationRepository extends BaseRepository {
  ExplorationRepository({required super.dio});

  Future<PaginatedResponse<Exploration>> fetchExplorations({
    int? page,
    int? limit,
    String? search,
  }) async {
    try {
      return await dio.get(
        'content',
        queryParameters: {
          'page': page ?? 1,
          'limit': limit ?? 10,
          'search': search,
        },
      ).then(
        (response) => ApiResponse.fromJson(
          response.data,
          (data) => PaginatedResponse.fromJson(
            data as Map<String, dynamic>,
            (json) => Exploration.fromJson(json as Map<String, dynamic>),
          ),
        ).data,
      );
    } catch (e) {
      logger.e('ExplorationRepository.fetchExplorations : $e');
      throw Exception('Failed to fetch explorations: $e');
    }
  }
}

@riverpod
Future<ExplorationRepository> explorationRepository(Ref ref) async {
  final dio = await ref.watch(dioProvider.future);
  return ExplorationRepository(dio: dio);
}
