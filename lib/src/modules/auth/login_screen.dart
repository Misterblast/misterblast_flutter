import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    children: [AppBackButton(), ChangeLocalButton()],
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      spacing: 16,
                      children: [
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
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
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
