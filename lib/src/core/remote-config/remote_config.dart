import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseRemoteConfig> firebaseRemoteConfig(Ref ref) async {
  final FirebaseRemoteConfig instance = FirebaseRemoteConfig.instance;
  await instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(hours: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ),
  );
  return instance;
}
