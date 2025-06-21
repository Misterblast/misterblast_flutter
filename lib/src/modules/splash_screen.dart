import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/constants/auth_state.dart';
import 'package:misterblast_flutter/src/providers/auth.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.listenManual(authNotifierProvider, (_, state) {
      logger.i("Auth state changed: $state");
      state.whenOrNull(
        data: (authState) {
          if (authState == AuthState.loggedIn) context.go("/home");
          if (authState == AuthState.loggedOut) context.go("/onboarding");
        },
        error: (error, stackTrace) {
          logger.e("Error in auth state: $error\n trace: $stackTrace");
          ref.read(authNotifierProvider.notifier).logout();
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/app-logo.png", scale: 3.5),
            Image.asset("assets/images/unesa-logo.png", scale: 3.5),
          ],
        ),
      ),
    );
  }
}
