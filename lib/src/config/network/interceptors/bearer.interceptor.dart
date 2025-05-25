import 'package:dio/dio.dart';
import 'package:misterblast_flutter/src/config/logger.dart';

import 'package:misterblast_flutter/src/constants/shared_preferences.key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BearerInterceptor extends Interceptor {
  final SharedPreferences sharedPreferences;

  BearerInterceptor({required this.sharedPreferences});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final String? token =
        sharedPreferences.getString(SharedPreferencesKey.accesToken.name);
    if (token != null && token.isNotEmpty) {
      logger.i('Adding Bearer token to request: $token\n');
      options.headers['Authorization'] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }
}
