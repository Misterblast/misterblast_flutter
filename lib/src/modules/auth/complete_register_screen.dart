import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class RegisterCompleted extends StatelessWidget {
  const RegisterCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [ChangeLocalButton()],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "auth.account-register".tr(),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                  children: [
                    TextSpan(
                      text: " ${"common.success".tr()}",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    )
                  ],
                ),
              ),
              Image.asset(
                "assets/images/register-success.png",
                width: 300,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "auth.account-register-success-desc-1".tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                  children: [
                    TextSpan(
                      text: " ${"common.taxonomy".tr()} ",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    TextSpan(
                      text: "auth.account-register-success-desc-2".tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 16,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "common.start-learn".tr(),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: context.pop,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 20,
                            Icons.chevron_left,
                            color: AppColors.primary,
                          ),
                          Text(
                            "auth.back-to-first-page".tr(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
