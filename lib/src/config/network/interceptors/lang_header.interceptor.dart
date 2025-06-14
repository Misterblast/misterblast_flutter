import 'package:dio/dio.dart';
import 'package:misterblast_flutter/src/config/logger.dart';

import 'package:misterblast_flutter/src/constants/shared_preferences.key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangHeaderInterceptor extends Interceptor {
  final SharedPreferences sharedPreferences;

  LangHeaderInterceptor({required this.sharedPreferences});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final String? locale =
        sharedPreferences.getString(SharedPreferencesKey.userLocal.name);
    if (locale != null && locale.isNotEmpty) {
      options.headers['Accept-Language'] = locale;
      logger.i('Language header set to: $locale');
    } else {
      logger.w('No language preference found, using default headers.');
    }

    super.onRequest(options, handler);
  }
}
