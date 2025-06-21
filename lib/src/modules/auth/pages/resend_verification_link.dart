import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/auth/notifiers/send_verification.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class ResendVerificationEmail extends ConsumerStatefulWidget {
  const ResendVerificationEmail({super.key, this.onPrevious});

  final VoidCallback? onPrevious;

  @override
  ConsumerState<ResendVerificationEmail> createState() =>
      _ResendVerificationEmailState();
}

class _ResendVerificationEmailState
    extends ConsumerState<ResendVerificationEmail> {
  late Timer _timer;
  int _remainingSeconds = 5;

  @override
  void initState() {
    super.initState();
    _startTimer();
    ref.listenManual(
      sendVerificationProvider,
      (_, state) => state.whenOrNull(
        data: (_) => context.pushReplacement(
          "/update-password?code=kontol-gajah",
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void _restartTimer() {
    setState(() {
      _remainingSeconds = 300;
    });
    _startTimer();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/mail.png",
              width: 250,
            ),
            Column(
              spacing: 8,
              children: [
                Text(
                  "forgot-password.reset-password-header".tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "forgot-password.check-email".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: _remainingSeconds > 0
                      ? null
                      : () {
                          ref
                              .read(sendVerificationProvider.notifier)
                              .resendEmail();
                        },
                  child: Text(
                    "forgot-password.resend-verification-email".tr(),
                  ),
                ),
                Text(
                  "forgot-password.not-received-email".tr(
                    namedArgs: {
                      "time": _formatTime(_remainingSeconds),
                    },
                  ),
                ),
                InkWell(
                  onTap: widget.onPrevious?.call,
                  child: Text(
                    context.tr("forgot-password.change-email"),
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
