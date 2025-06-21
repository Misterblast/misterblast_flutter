import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/modules/auth/notifiers/send_verification.dart';
import 'package:misterblast_flutter/src/modules/auth/pages/input_email.dart';
import 'package:misterblast_flutter/src/modules/auth/pages/resend_verification_link.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class ResetPassword extends ConsumerStatefulWidget {
  const ResetPassword({super.key});

  @override
  ConsumerState<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ResetPassword> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ref.listenManual(sendVerificationProvider, (_, state) {
      state.whenOrNull(
        loading: () => _loadingOverlay.show(context),
        data: (_) {
          _loadingOverlay.hide();
          if (_pageController.page == 0) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        error: (error, stack) {
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
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ForgotPasswordInputEmail(
                      onSubmit: (email) => ref
                          .read(sendVerificationProvider.notifier)
                          .sendVerificationEmail(email),
                    ),
                    ResendVerificationEmail(
                      onPrevious: () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
