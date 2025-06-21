import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/modules/profile/notifier/update_user_notifier.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class UpdatePasswordScreen extends ConsumerStatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  ConsumerState<UpdatePasswordScreen> createState() =>
      _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends ConsumerState<UpdatePasswordScreen> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    ref.listenManual(updateUserNotifierProvider, (_, state) {
      state.whenOrNull(
        data: (data) {
          if (data) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.coolTeal,
                content: Text(
                  context.tr("profile.password-updated"),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            );
          }
          _loadingOverlay.hide();
          context.pop();
        },
        loading: () => _loadingOverlay.show(context),
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
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset("assets/images/home_decor.png"),
              Column(
                spacing: 14,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBackButton(
                          backgroundColor: theme.colorScheme.secondary,
                        ),
                        ChangeLocalButton(
                          formKey: _formKey,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Container(
                        color: Colors.white,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextFormField(
                                  obsecure: true,
                                  label: context.tr("profile.current-password"),
                                  controller: _currentPasswordController,
                                  hintText: context.tr(
                                      "profile.current-password-placeholder"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return context.tr(
                                        "auth.exceptions.field-required",
                                        namedArgs: {
                                          "fieldName": context
                                              .tr("profile.new-password"),
                                        },
                                      );
                                    }
                                    return null;
                                  },
                                ),
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
                                          "fieldName": context
                                              .tr("profile.new-password"),
                                        },
                                      );
                                    }
                                    return null;
                                  },
                                ),
                                AppTextFormField(
                                  obsecure: true,
                                  label: context
                                      .tr("profile.confirm-new-password"),
                                  controller: _confirmPasswordController,
                                  hintText: context.tr(
                                      "profile.confirm-new-password-placeholder"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return context.tr(
                                        "auth.exceptions.field-required",
                                        namedArgs: {
                                          "fieldName": context.tr(
                                              "profile.confirm-new-password")
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
                                SizedBox.shrink(),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      ref
                                          .read(updateUserNotifierProvider
                                              .notifier)
                                          .updatePassword(
                                              _passwordController.text);
                                    }
                                  },
                                  child: Text(context.tr(
                                      "forgot-password.reset-password-button")),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
