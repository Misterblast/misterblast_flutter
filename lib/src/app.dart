import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      supportedLocales: [
        const Locale('en'),
        const Locale('id'),
      ],
      locale: Locale('id'),
      routerConfig: ref.read(routerProvider),
    );
  }
}
