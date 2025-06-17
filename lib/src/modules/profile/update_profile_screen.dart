import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/modules/profile/notifier/update_user_notifier.dart';
import 'package:misterblast_flutter/src/providers/user.dart';
import 'package:misterblast_flutter/src/utils/is_string_url.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/circle_image_field.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  ConsumerState<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  String? _imagePath;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final user = ref.read(userProvider).valueOrNull;
    if (user != null) {
      _nameController.text = user.name;
      _emailController.text = user.email;
      _imagePath = user.imgUrl;
    }

    ref.listenManual(updateUserNotifierProvider, (_, state) {
      state.whenOrNull(
        data: (data) {
          ref.invalidate(userProvider);
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
  Widget build(BuildContext context) {
    final user = ref.read(userProvider).valueOrNull;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ref.read(updateUserNotifierProvider.notifier).updateUser(
                      userId: user!.id.toString(),
                      name: _nameController.text,
                      email: _emailController.text,
                      imgUrl: (_imagePath == null || _imagePath!.isUrl)
                          ? null
                          : _imagePath,
                    );
              }
            },
            child: Text(context.tr("common.submit")),
          ),
        ),
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
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        ChangeLocalButton(),
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
                            autovalidateMode: AutovalidateMode.onUnfocus,
                            child: Column(
                              spacing: 16,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CircleImageField(
                                    width: 100,
                                    height: 100,
                                    filePath: _imagePath,
                                    onImageSelected: (path) =>
                                        setState(() => _imagePath = path),
                                  ),
                                ),
                                AppTextFormField(
                                  label: context.tr("auth.full-name"),
                                  controller: _nameController,
                                  hintText:
                                      context.tr("auth.full-name-placeholder"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return context.tr(
                                        "auth.exceptions.field-required",
                                        namedArgs: {
                                          "fieldName":
                                              context.tr("auth.full-name"),
                                        },
                                      );
                                    }
                                    return null;
                                  },
                                ),
                                AppTextFormField(
                                  label: context.tr("auth.email"),
                                  controller: _emailController,
                                  hintText:
                                      context.tr("auth.email-placeholder"),
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
