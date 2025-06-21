import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/modules/auth/notifiers/login_notifier.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    ref.listenManual(
      loginNotifierProvider,
      (_, state) {
        state.whenOrNull(
          loading: () => _loadingOverlay.show(context),
          data: (data) {
            _loadingOverlay.hide();
            context.go("/home");
          },
          error: (error, stackTrace) {
            _loadingOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.tr(error.toString())),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 32,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(),
                      ChangeLocalButton(formKey: _formKey)
                    ],
                  ),
                ),
                Column(
                  spacing: 48,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              width: 120,
                              height: 120,
                              "assets/images/app-logo.png",
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              width: 120,
                              height: 120,
                              "assets/images/unesa-logo.png",
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "auth.header".tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                children: [
                                  TextSpan(
                                    text: " GoAssessment",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "auth.description".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      spacing: 16,
                      children: [
                        AppTextFormField(
                          label: "auth.email".tr(),
                          hintText: "auth.email-placeholder".tr(),
                          validator: (value) {
                            if (value.isEmpty) {
                              return context.tr(
                                "auth.exceptions.field-required",
                                namedArgs: {"fieldName": "Email"},
                              );
                            }
                            final emailRegex = RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return context.tr(
                                "auth.exceptions.invalid-email",
                              );
                            }
                            return null;
                          },
                          controller: _emailController,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppTextFormField(
                              obsecure: true,
                              label: context.tr("auth.password"),
                              hintText:
                                  "auth.password-hint-placeholder-min-char"
                                      .tr(),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return context.tr(
                                    "auth.exceptions.field-required",
                                    namedArgs: {
                                      "fieldName": context.tr("auth.password")
                                    },
                                  );
                                }
                                if (value.length < 8) {
                                  return context.tr(
                                    "auth.exceptions.min-password-length",
                                  );
                                }
                                return null;
                              },
                              controller: _passwordController,
                            ),
                            TextButton(
                              child: Text("auth.forgot-password".tr()),
                              onPressed: () => context.push("/reset-password"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            FocusScope.of(context).unfocus();
                            ref.read(loginNotifierProvider.notifier).login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                          },
                          child: Text(
                            "auth.login".tr(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
