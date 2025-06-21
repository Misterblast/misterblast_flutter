import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/modules/auth/notifiers/reset_password.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class UpdatePassword extends ConsumerStatefulWidget {
  const UpdatePassword({
    super.key,
    required this.code,
  });

  final String code;

  @override
  ConsumerState<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends ConsumerState<UpdatePassword> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ref.listenManual(resetPasswordProvider, (_, state) {
      state.whenOrNull(
        loading: () => _loadingOverlay.show(context),
        data: (data) {
          _loadingOverlay.hide();
          if (data) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  context.tr("forgot-password.password-reset-success"),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            );
            context.pushReplacement("/login");
          }
        },
        error: (error, stackTrace) {
          _loadingOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                context.tr("exceptions.unknown-error"),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          );
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [AppBackButton(), ChangeLocalButton()],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 32,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/lock.png",
                            scale: 3.5,
                          ),
                          Column(
                            spacing: 8,
                            children: [
                              Text(
                                context.tr(
                                    "forgot-password.reset-password-header"),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              Text(
                                "forgot-password.input-new-password-desc".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            spacing: 8,
                            children: [
                              AppTextFormField(
                                obsecure: true,
                                label: context.tr("profile.new-password"),
                                controller: _passwordController,
                                hintText: context
                                    .tr("profile.new-password-placeholder"),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return context.tr(
                                      "auth.exceptions.field-required",
                                      namedArgs: {
                                        "fieldName":
                                            context.tr("profile.new-password"),
                                      },
                                    );
                                  }
                                  return null;
                                },
                              ),
                              AppTextFormField(
                                obsecure: true,
                                label:
                                    context.tr("profile.confirm-new-password"),
                                controller: _confirmPasswordController,
                                hintText: context.tr(
                                  "profile.confirm-new-password-placeholder",
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return context.tr(
                                      "auth.exceptions.field-required",
                                      namedArgs: {
                                        "fieldName": context
                                            .tr("profile.confirm-new-password")
                                      },
                                    );
                                  }
                                  if (value != _passwordController.text) {
                                    return context.tr(
                                      "auth.exceptions.passwords-not-match",
                                    );
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                ref
                                    .read(resetPasswordProvider.notifier)
                                    .resetPassword(
                                      widget.code,
                                      _passwordController.text,
                                    );
                              }
                            },
                            child: Text(context
                                .tr("forgot-password.reset-password-button")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
