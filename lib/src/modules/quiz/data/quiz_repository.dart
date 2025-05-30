import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;

import 'package:misterblast_flutter/src/models/api_response.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_explanation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_question.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_submission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository extends BaseRepository {
  QuizRepository({required super.dio});

  Future<List<QuizQuestion>> fetchQuiz(int subjectId) async {
    final String json = '''{
  "message": "questions retrieved successfully",
  "data": [
    {
      "id": 11,
      "number": 1,
      "type": "C2",
      "content": "Hewan berkaki dua adalah?",
      "set_id": 9,
      "answers": [
        {
          "id": 6,
          "code": "a",
          "content": "semut",
          "img_url": null
        },
        {
          "id": 5,
          "code": "b",
          "content": "Katak",
          "img_url": null
        },
        {
          "id": 4,
          "code": "c",
          "content": "Ikan",
          "img_url": null
        }
      ]
    },
    {
      "id": 10,
      "number": 2,
      "type": "C4",
      "content": "Hewan berkaki tiga adalah?",
      "set_id": 9,
      "answers": [
        {
          "id": 1,
          "code": "a",
          "content": "Kerbau",
          "img_url": null
        },
        {
          "id": 2,
          "code": "b",
          "content": "Singa",
          "img_url": null
        },
        {
          "id": 3,
          "code": "c",
          "content": "Ikan",
          "img_url": null
        }
      ]
    }
  ]
}''';
    try {
      await Future.delayed(const Duration(seconds: 2));
      // final response =
      //     await dio.get('quiz', queryParameters: {"lesson_id": subjectId});
      final ApiResponse<List<QuizQuestion>> result = ApiResponse.fromJson(
        jsonDecode(json),
        (items) =>
            (items as List).map((item) => QuizQuestion.fromJson(item)).toList(),
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> submitQuiz(
    int subjectId,
    List<Map<String, dynamic>> answers,
  ) async {
    try {
      // final response = await dio.post(
      //   'submit-quiz/$subjectId',
      //   data: {"answers": answers},
      // );
      await Future.delayed(const Duration(seconds: 2));
      final String json = '''{
  "message": "questions retrieved successfully",
  "data": 1}
''';
      final ApiResponse<int> result = ApiResponse.fromJson(
        jsonDecode(json),
        (item) => item as int,
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<QuizSubmission>> fetchQuizSubmissions(int? subjectId) async {
    try {
      final response = await dio.get('quiz-submission');
      final ApiResponse<List<QuizSubmission>> result = ApiResponse.fromJson(
        response.data,
        (items) => (items as List)
            .map((item) => QuizSubmission.fromJson(item))
            .toList(),
      );
      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuizExplanation> fetchQuizResult(int resultId) async {
    try {
      final response = await dio.get('quiz-result/$resultId');
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
