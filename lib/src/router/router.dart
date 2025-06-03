import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/activity/activity_screen.dart';
import 'package:misterblast_flutter/src/modules/auth/complete_register_screen.dart';

import 'package:misterblast_flutter/src/modules/auth/login_screen.dart';
import 'package:misterblast_flutter/src/modules/auth/register_screen.dart';
import 'package:misterblast_flutter/src/modules/auth/reset_password.dart';
import 'package:misterblast_flutter/src/modules/auth/update_password.dart';
import 'package:misterblast_flutter/src/modules/examples/example_detail_screen.dart';
import 'package:misterblast_flutter/src/modules/examples/search_example_screen.dart';
import 'package:misterblast_flutter/src/modules/exploration/exploration_screen.dart';
import 'package:misterblast_flutter/src/modules/examples/example_screen.dart';
import 'package:misterblast_flutter/src/modules/home/home_screen.dart';
import 'package:misterblast_flutter/src/modules/main_scaffold.dart';
import 'package:misterblast_flutter/src/modules/onboarding/onboarding_screen.dart';
import 'package:misterblast_flutter/src/modules/profile/profile_screen.dart';
import 'package:misterblast_flutter/src/modules/quiz/on_quiz_screen.dart';
import 'package:misterblast_flutter/src/modules/quiz/quiz_result_screen.dart';
import 'package:misterblast_flutter/src/modules/quiz/quiz_screen.dart';
import 'package:misterblast_flutter/src/modules/quiz/quiz_submission_list.dart';
import 'package:misterblast_flutter/src/modules/splash_screen.dart';
import 'package:misterblast_flutter/src/modules/task/task_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/splash",
        builder: (context, state) => const SplashScreen(),
      ),
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
        builder: (context, state) {
          final extras = state.extra as Map<String, String>;
          final email = extras['email'] ?? '';
          final password = extras['password'] ?? '';
          return RegisterCompleted(email: email, password: password);
        },
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
      GoRoute(
        path: "/quiz",
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const QuizScreen(),
        routes: [
          GoRoute(
            path: "/on-quiz",
            builder: (context, state) {
              final stateExtra = (state.extra as Map<String, dynamic>);
              final subject = stateExtra['subject'] ?? '';
              final questions = stateExtra['questions'] ?? [];
              final questionSet = stateExtra['question-set'] ?? '';
              return OnQuizScreen(
                subject: subject,
                quizQuestions: questions,
                questionSet: questionSet,
              );
            },
          ),
          GoRoute(
            path: "/submission-list",
            builder: (context, state) {
              return QuizSubmissionList();
            },
          ),
          GoRoute(
            path: "/result-detail/:resultId",
            builder: (context, state) {
              final resultId = state.pathParameters['resultId'] ?? '';
              return QuizResultScreen(resultId: int.parse(resultId));
            },
          ),
        ],
      ),
      GoRoute(
        path: "/task",
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          return TaskScreen();
        },
      ),
      GoRoute(
        path: '/examples',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const ExampleScreen(),
        routes: [
          GoRoute(
            path: "/example-questions",
            builder: (context, state) {
              final queryParameters = state.uri.queryParameters;
              final subjectName = queryParameters['subjectName'] ?? '';
              final className = queryParameters['className'] ?? '';
              final subjectCode = queryParameters['subjectCode'] ?? '';
              final initialSetId = int.tryParse(
                queryParameters['initialSetId'] ?? '',
              );
              return ExampleDetailScreen(
                className: className,
                subjectCode: subjectCode,
                subjectName: subjectName,
                initialSetId: initialSetId,
              );
            },
          ),
          GoRoute(
            path: "/search-examples",
            builder: (context, state) => const SearchExampleScreen(),
          ),
        ],
      ),
      GoRoute(
        path: "/task",
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const QuizScreen(),
        routes: [],
      ),
      ShellRoute(
        parentNavigatorKey: rootNavigatorKey,
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainScaffold(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/activity',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ActivityScreen(),
            ),
          ),
          GoRoute(
            path: '/exploration',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ExplorationScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
