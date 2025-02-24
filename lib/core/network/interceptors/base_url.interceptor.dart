import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class BaseUrlInterceptor extends Interceptor {
  final FirebaseRemoteConfig remoteConfigInstance;

  BaseUrlInterceptor({required FirebaseRemoteConfig instance})
      : remoteConfigInstance = instance;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final String baseUrl = remoteConfigInstance.getString("base_url");
    options.baseUrl = baseUrl;
    super.onRequest(options, handler);
  }
}
