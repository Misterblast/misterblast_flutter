import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/auth/complete_register_screen.dart';

import 'package:misterblast_flutter/src/modules/auth/login_screen.dart';
import 'package:misterblast_flutter/src/modules/auth/register_screen.dart';
import 'package:misterblast_flutter/src/modules/auth/reset_password.dart';
import 'package:misterblast_flutter/src/modules/auth/update_password.dart';
import 'package:misterblast_flutter/src/modules/home/home_screen.dart';
import 'package:misterblast_flutter/src/modules/main_scaffold.dart';
import 'package:misterblast_flutter/src/modules/onboarding/onboarding_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
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
      GoRoute(
        path: "/reset-password",
        builder: (context, state) => const ResetPassword(),
      ),
      GoRoute(
        path: "/reset-password-verification",
        builder: (context, state) {
          final email = state.uri.queryParameters["email"] ?? '';
          final code = state.uri.queryParameters["code"] ?? '';
          return UpdatePassword(
            email: email,
            code: code,
          );
        },
      ),
      ShellRoute(
        parentNavigatorKey: rootNavigatorKey,
        navigatorKey: shellNavigatorKey,
        builder: (_, state, child) {
          return MainScaffold(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (_, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/activity',
            pageBuilder: (_, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/exploration',
            pageBuilder: (_, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (_, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
