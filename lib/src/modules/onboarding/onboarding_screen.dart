import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/onboarding/widgets/onbording_top_bar.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnboardingTopBar(),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      "assets/images/onboarding-asset.png",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              context.tr("onboarding.title"),
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            AutoSizeText(
                              context.tr("common.taxonomy"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: context
                                        .tr("onboarding.description")
                                        .split("{remember}")[0],
                                  ),
                                  TextSpan(
                                    text: context.tr("common.remember"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  TextSpan(
                                    text: context
                                        .tr("onboarding.description")
                                        .split("{remember}")[1]
                                        .split("{analyze}")[0],
                                  ),
                                  TextSpan(
                                    text: context.tr("common.analyze"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  TextSpan(
                                    text: context
                                        .tr("onboarding.description")
                                        .split("{analyze}")[1]
                                        .split("{create}")[0],
                                  ),
                                  TextSpan(
                                    text: context.tr("common.create"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  TextSpan(
                                    text: context
                                        .tr("onboarding.description")
                                        .split("{create}")[1],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () => context.push("/login"),
                            child: Text(context.tr("auth.login")),
                          ),
                          OutlinedButton(
                            onPressed: () => context.push("/register"),
                            child: Text(context.tr("auth.register")),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
