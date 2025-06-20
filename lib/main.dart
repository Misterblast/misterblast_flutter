import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/notification/firebase_messaging.dart';
import 'package:misterblast_flutter/src/app.dart';
import 'package:misterblast_flutter/src/providers/observers/log.observer.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: EasyLocalization(
        useOnlyLangCode: true,
        path: 'assets/locales',
        fallbackLocale: const Locale('en'),
        supportedLocales: const [
          Locale('en'),
          Locale('id'),
        ],
        child: const App(),
      ),
    ),
  );
}
