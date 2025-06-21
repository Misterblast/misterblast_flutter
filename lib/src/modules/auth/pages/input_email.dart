import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';

class ForgotPasswordInputEmail extends StatefulWidget {
  const ForgotPasswordInputEmail({
    super.key,
    required this.onSubmit,
  });

  final Function(String)? onSubmit;

  @override
  State<ForgotPasswordInputEmail> createState() =>
      _ForgotPasswordInputEmailState();
}

class _ForgotPasswordInputEmailState extends State<ForgotPasswordInputEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 32,
        children: [
          Image.asset(
            "assets/images/key.png",
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 12,
              children: [
                Text(
                  "forgot-password.reset-password-header".tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "forgot-password.reset-password-description".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                spacing: 32,
                children: [
                  AppTextFormField(
                    label: "auth.email".tr(),
                    hintText: "auth.email-placeholder".tr(),
                    controller: _emailController,
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
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          FocusScope.of(context).unfocus();
                          widget.onSubmit?.call(_emailController.text);
                        },
                        child: Text(
                          "forgot-password.send-verification-email".tr(),
                        ),
                      ),
                      Text(
                        "forgot-password.send-verification-email-description"
                            .tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
