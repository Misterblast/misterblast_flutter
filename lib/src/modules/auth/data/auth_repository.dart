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

      return token.split(";").first.replaceAll("token=", '');
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
      rethrow;
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String? imagePath,
  ) async {
    try {
      final FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        if (imagePath != null) 'image': await MultipartFile.fromFile(imagePath),
      });
      await dio.post(
        'register',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw 'auth.exceptions.invalid-email-or-password';
      } else {
        throw 'exceptions.unknown-error';
      }
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> sendVerificationEmail(String email) async {
    try {
      await dio.post(
        'forgot-password',
        data: {'email': email},
      );
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> resetPassword(String code, String password) async {
    try {
      await dio.put('reset-password', data: {
        "token": code,
        "password": password,
      });
    } catch (e) {
      throw 'Failed to reset password: $e';
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepository(dio: ref.watch(dioProvider).value!);
