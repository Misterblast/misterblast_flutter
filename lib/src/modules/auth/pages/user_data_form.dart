import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required this.onNextPage,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final VoidCallback? onNextPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: Column(
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
                        text: "auth.register-header".tr(),
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "auth.description".tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              spacing: 32,
              children: [
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
                  onPressed: onNextPage,
                  style: ButtonStyle(),
                  child: Row(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.tr("common.next")),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
