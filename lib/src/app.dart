import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/config/network/dio.dart';
import 'package:misterblast_flutter/src/config/remote-config/remote_config.dart';
import 'package:misterblast_flutter/src/router/router.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(firebaseRemoteConfigProvider);
    ref.watch(dioProvider);
    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: ref.read(routerProvider),
    );
  }
}
