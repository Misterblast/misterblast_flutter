import 'package:dio/dio.dart';
import 'package:misterblast_flutter/src/config/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i(
        'Request: ${options.method} \n ${options.uri} \n ${options.data}\n${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('Response: ${response.statusCode} ${response.statusMessage}\n'
        'URL: ${response.requestOptions.uri}\n');
    if (response.data != null) {
      logger.i('Response Data: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      'Error: $err\n'
      'Request: ${err.requestOptions.method} \n'
      'URL: ${err.requestOptions.uri} \n'
      'Data: ${err.requestOptions.data} \n'
      'Response: ${err.response?.statusCode} ${err.response?.statusMessage}\n'
      'Error Message: ${err.response?.data}',
    );
    super.onError(err, handler);
  }
}
