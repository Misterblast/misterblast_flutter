import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/auth/pages/input_email.dart';
import 'package:misterblast_flutter/src/modules/auth/pages/resend_verification_link.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            spacing: 42,
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
              Flexible(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ForgotPasswordInputEmail(
                      onSubmit: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    ResendVerificationEmail(),
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
