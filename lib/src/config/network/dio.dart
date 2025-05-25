import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/local-storage/shared_preferences.dart';
import 'package:misterblast_flutter/src/config/network/interceptors/base_url.interceptor.dart';
import 'package:misterblast_flutter/src/config/network/interceptors/bearer.interceptor.dart';
import 'package:misterblast_flutter/src/config/network/interceptors/log.interceptor.dart';
import 'package:misterblast_flutter/src/config/remote-config/remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dio.g.dart';

@Riverpod(keepAlive: true)
Future<Dio> dio(Ref ref) async {
  final SharedPreferences sharedPreferences =
      await ref.watch(sharedPreferencesProvider.future);
  final FirebaseRemoteConfig remoteConfigInstance =
      await ref.watch(firebaseRemoteConfigProvider.future);

  Dio dioInstance = Dio();
  dioInstance.options.sendTimeout = const Duration(minutes: 10);
  dioInstance.options.receiveTimeout = const Duration(minutes: 10);
  dioInstance.options.connectTimeout = const Duration(minutes: 10);
  dioInstance.interceptors.addAll([
    LoggingInterceptor(),
    BaseUrlInterceptor(instance: remoteConfigInstance),
    BearerInterceptor(sharedPreferences: sharedPreferences),
  ]);
  return dioInstance;
}
