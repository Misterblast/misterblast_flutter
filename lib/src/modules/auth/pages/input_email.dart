import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';

class ForgotPasswordInputEmail extends StatelessWidget {
  const ForgotPasswordInputEmail({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback? onSubmit;

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
            child: Column(
              spacing: 32,
              children: [
                AppTextFormField(
                  label: "auth.email".tr(),
                  hintText: "auth.email-placeholder".tr(),
                ),
                Column(
                  spacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: onSubmit,
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
        ],
      ),
    );
  }
}
