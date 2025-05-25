import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository extends BaseRepository {
  AuthRepository({required super.dio});

  Future<String> login(String email, String password) async {
    try {
      final response = await dio.post(
        'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final token = response.headers["Set-Cookie"]?.firstWhere(
        (cookie) => cookie.startsWith('token='),
        orElse: () => '',
      );
      if (token == null || token.isEmpty) {
        throw 'invalid-response-header';
      }
      return token.replaceAll("token=", '');
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 404) {
        throw 'auth.exceptions.invalid-email-or-password';
      } else {
        logger.e(
          'DioException during login: ${e.error} - ${e.message}',
          stackTrace: StackTrace.current,
        );
        throw e.error ?? 'exceptions.unknown-error';
      }
    } catch (e) {
      logger.e('Failed to register: $e', stackTrace: StackTrace.current);
      throw 'Failed to login: $e';
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String? imagePath,
  ) async {
    try {
      await dio.post(
        'register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('auth.exceptions.invalid-email-or-password');
      } else {
        throw Exception(e.message ?? 'exceptions.unknown-error');
      }
    } catch (e) {
      logger.e('Failed to register: $e');
      throw Exception('Failed to register: $e');
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepository(dio: ref.watch(dioProvider).value!);
