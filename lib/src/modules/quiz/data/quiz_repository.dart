import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;

import 'package:misterblast_flutter/src/models/api_response.dart';
import 'package:misterblast_flutter/src/models/paginated_response.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_explanation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_set.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_submission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository extends BaseRepository {
  QuizRepository({required super.dio});

  Future<QuizSet> fetchQuiz(int subjectId) async {
    try {
      final response =
          await dio.get('quiz', queryParameters: {"lesson_id": subjectId});
      final ApiResponse<QuizSet> result = ApiResponse.fromJson(
        response.data,
        (item) => QuizSet.fromJson(item as Map<String, dynamic>),
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> submitQuiz(
    int questionSetId,
    List<Map<String, dynamic>> answers,
  ) async {
    try {
      final response = await dio.post(
        'submit-quiz/$questionSetId',
        data: {"answers": answers},
      );
      final ApiResponse<int> result = ApiResponse.fromJson(
        response.data,
        (item) => item as int,
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<QuizSubmission>> fetchQuizSubmissions({
    required int page,
    int? subjectId,
  }) async {
    try {
      final response = await dio.get(
        'quiz-submission',
        queryParameters: {
          "limit": 10,
          "page": page,
          if (subjectId != null) "lesson_id": subjectId,
        },
      );
      final ApiResponse<PaginatedResponse<QuizSubmission>> result =
          ApiResponse.fromJson(
        response.data,
        (item) => PaginatedResponse<QuizSubmission>.fromJson(
          item as Map<String, dynamic>,
          (data) => QuizSubmission.fromJson(data as Map<String, dynamic>),
        ),
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuizExplanation> fetchQuizResult(int resultId) async {
    try {
      final response = await dio.get('quiz-submission/$resultId');
      final ApiResponse<QuizExplanation> result = ApiResponse.fromJson(
        response.data,
        (item) => QuizExplanation.fromJson(item as Map<String, dynamic>),
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
Future<QuizRepository> quizRepository(Ref ref) async =>
    QuizRepository(dio: await ref.watch(dioProvider.future));
