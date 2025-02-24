import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/core/network/interceptors/base_url.interceptor.dart';
import 'package:misterblast_flutter/core/remote-config/remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@Riverpod(keepAlive: true)
Future<Dio> dio(Ref ref) async {
  final FirebaseRemoteConfig remoteConfigInstance =
      await ref.watch(firebaseRemoteConfigProvider.future);

  Dio dioInstance = Dio();
  dioInstance.options.sendTimeout = const Duration(minutes: 10);
  dioInstance.options.receiveTimeout = const Duration(minutes: 10);
  dioInstance.options.connectTimeout = const Duration(minutes: 10);
  dioInstance.interceptors
      .addAll([BaseUrlInterceptor(instance: remoteConfigInstance)]);
  return dioInstance;
}
