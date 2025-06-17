import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/base_repository.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart'
    show dioProvider;

import 'package:misterblast_flutter/src/models/api_response.dart';
import 'package:misterblast_flutter/src/models/user.dart';
import 'package:misterblast_flutter/src/models/user_summary.dart';
import 'package:misterblast_flutter/src/utils/is_string_url.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository extends BaseRepository {
  UserRepository({required super.dio});

  Future<User> getMe() async {
    try {
      final response = await dio.get('me').then(
            (response) => ApiResponse<User>.fromJson(
              response.data,
              (data) => User.fromJson(data as Map<String, dynamic>),
            ),
          );
      return response.data;
    } catch (e) {
      throw 'Failed to fetch user data: $e';
    }
  }

  Future<UserSummary> getUserSummary() async {
    try {
      final response = await dio.get('summary').then(
            (response) => ApiResponse<UserSummary>.fromJson(
              response.data,
              (data) => UserSummary.fromJson(data as Map<String, dynamic>),
            ),
          );
      return response.data;
    } catch (e) {
      throw 'Failed to fetch user summary: $e';
    }
  }

  Future<void> updateUser({
    required String userId,
    String? email,
    String? name,
    String? filePath,
  }) async {
    try {
      Map<String, dynamic> formData = {};
      if (email != null) formData['email'] = email;
      if (name != null) formData['name'] = name;
      if (filePath != null && !filePath.isUrl && filePath.isNotEmpty) {
        formData['image'] = await MultipartFile.fromFile(filePath);
      }

      await dio.post(
        'users/$userId',
        data: FormData.fromMap(formData),
      );
    } catch (e) {
      throw 'Failed to update user: $e';
    }
  }
}

@Riverpod(keepAlive: true)
Future<UserRepository> userRepository(Ref ref) async {
  return UserRepository(dio: await ref.watch(dioProvider.future));
}
