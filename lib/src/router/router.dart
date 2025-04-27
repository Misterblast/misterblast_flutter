import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/auth/complete_register_screen.dart';

import 'package:misterblast_flutter/src/modules/auth/login_screen.dart';
import 'package:misterblast_flutter/src/modules/auth/register_screen.dart';
import 'package:misterblast_flutter/src/modules/onboarding/onboarding_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/onboarding",
    routes: [
      GoRoute(
        path: "/onboarding",
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: "/register-completed",
        builder: (context, state) => const RegisterCompleted(),
      ),
    ],
  );
}
