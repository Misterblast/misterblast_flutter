import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseRemoteConfig> firebaseRemoteConfig(Ref ref) async {
  final FirebaseRemoteConfig instance = FirebaseRemoteConfig.instance;
  await instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 30),
    ),
  );
  logger.i('Firebase Remote Config initialized');
  await instance.fetchAndActivate().then(
    (bool updated) {
      final values = instance
          .getAll()
          .entries
          .map((e) => '${e.key}: ${e.value.asString()}')
          .join('\n');
      if (updated) {
        logger.i('Firebase Remote Config activated with new values\n $values');
      } else {
        logger.i(
            'Firebase Remote Config activated with cached values \n $values');
      }
    },
  ).catchError(
    (error) {
      logger.e('Failed to fetch and activate Firebase Remote Config: $error');
    },
  );
  return instance;
}
