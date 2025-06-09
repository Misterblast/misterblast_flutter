import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;
import 'package:misterblast_flutter/src/models/api_response.dart';

import 'package:misterblast_flutter/src/models/paginated_response.dart';
import 'package:misterblast_flutter/src/modules/task/models/task.dart';
import 'package:misterblast_flutter/src/modules/task/models/task_submission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_repository.g.dart';

class TaskRepository extends BaseRepository {
  TaskRepository({required super.dio});

  Future<PaginatedResponse<Task>> fetchTasks({
    int? page,
    int? limit,
    String? search,
  }) async {
    try {
      return await dio.get('tasks', queryParameters: {
        'page': page ?? 1,
        'limit': limit ?? 10,
        'search': search,
      }).then(
        (response) => ApiResponse.fromJson(
          response.data,
          (data) => PaginatedResponse.fromJson(
            data as Map<String, dynamic>,
            (json) => Task.fromJson(json as Map<String, dynamic>),
          ),
        ).data,
      );
    } catch (e) {
      logger.e('Error fetching tasks: $e');
      rethrow;
    }
  }

  Future<TaskDetail> fetchTaskDetail(int taskId) async {
    try {
      return await dio.get('tasks/$taskId').then(
            (response) => ApiResponse.fromJson(
              response.data,
              (data) => TaskDetail.fromJson(data as Map<String, dynamic>),
            ).data,
          );
    } catch (e) {
      logger.e('Error fetching task detail for taskId $taskId: $e');
      rethrow;
    }
  }

  Future<void> submitTask(taskId, String answer, String? filePath) async {
    try {
      final formData = FormData.fromMap({
        "answer": answer,
        if (filePath != null) 'file': await MultipartFile.fromFile(filePath),
      });
      await dio.post(
        'submit-task/$taskId',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
    } catch (e) {
      logger.e('Error SubmitTask for taskId $taskId: $e');
      rethrow;
    }
  }

  Future<PaginatedResponse<TaskSubmission>> fetchSubmissions({
    int? page,
    int? limit,
  }) async {
    try {
      return await dio.get('my-submissions', queryParameters: {
        "page": page ?? 1,
        "limit": limit ?? 10,
      }).then(
        (response) => ApiResponse.fromJson(
          response.data,
          (data) => PaginatedResponse.fromJson(
            data as Map<String, dynamic>,
            (json) => TaskSubmission.fromJson(json as Map<String, dynamic>),
          ),
        ).data,
      );
    } catch (err) {
      logger.e('Error fetching submissions: $err');
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
Future<TaskRepository> taskRepository(Ref ref) async =>
    TaskRepository(dio: await ref.watch(dioProvider.future));
