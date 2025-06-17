import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/circle_image_field.dart';

class PickImageForm extends StatelessWidget {
  const PickImageForm({
    super.key,
    required this.onPreviousPage,
    required this.onSubmit,
    this.onImageSelected,
    this.filePath,
  });

  final String? filePath;
  final Function(String?)? onImageSelected;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 64,
        children: [
          Column(
            spacing: 32,
            children: [
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
                    "auth.setup-profile-image".tr(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              CircleImageField(
                onImageSelected: onImageSelected,
                filePath: filePath,
              ),
              Text(
                "common.tap-to-change".tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                ElevatedButton(
                  onPressed: onSubmit,
                  style: ButtonStyle(),
                  child: Text(context.tr("auth.register")),
                ),
                OutlinedButton(
                  onPressed: onPreviousPage,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        size: 20,
                        Icons.chevron_left,
                        color: AppColors.primary,
                      ),
                      Text(
                        context.tr("common.back"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
