import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        statusBarIconBrightness:
            Brightness.dark, // Dark icons for light background
        systemNavigationBarColor: Colors.white, // Navigation bar color
        systemNavigationBarIconBrightness:
            Brightness.dark, // Dark icons for navigation bar
      ),
    );
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  spacing: 48,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [AppBackButton(), ChangeLocalButton()],
                    ),
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
                                text: "auth.register-header".tr(),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        spacing: 8,
                        children: [
                          AppTextFormField(
                            label: "auth.full-name".tr(),
                            hintText: "auth.full-name-placeholder".tr(),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "auth.exceptions".tr(
                                  namedArgs: {
                                    "fieldName": "auth.full-name".tr(),
                                  },
                                );
                              }
                              return null;
                            },
                            controller: _nameController,
                          ),
                          AppTextFormField(
                            label: "auth.email".tr(),
                            hintText: "auth.email-placeholder".tr(),
                            validator: (value) {
                              return null;
                            },
                            controller: _emailController,
                          ),
                          AppTextFormField(
                            obsecure: true,
                            label: "auth.password".tr(),
                            hintText:
                                "auth.password-hint-placeholder-min-char".tr(),
                            validator: (value) {
                              return null;
                            },
                            controller: _passwordController,
                          ),
                          AppTextFormField(
                            obsecure: true,
                            label: "auth.repeat-password-hint-placeholder".tr(),
                            hintText:
                                "auth.password-hint-placeholder-min-char".tr(),
                            validator: (value) {
                              return null;
                            },
                            controller: _confirmPasswordController,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      style: ButtonStyle(),
                      child: Row(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(context.tr("auth.login")),
                          Icon(Icons.chevron_right,
                              color: Colors.white, size: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
