import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:misterblast_flutter/src/utils/pick_image.dart';
import 'package:misterblast_flutter/src/widgets/select_image_source_dialog.dart';

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
              InkWell(
                onTap: () async {
                  final ImageSource? source = await showDialog<ImageSource?>(
                    context: context,
                    builder: (context) => const SelectImageSourceDialog(),
                  );
                  if (source == null) return;
                  final String? image = await pickImage(source);
                  if (image == null) return;
                  onImageSelected?.call(image);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 4,
                    ),
                    image: filePath != null
                        ? DecorationImage(
                            image: FileImage(File(filePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: filePath != null
                      ? null
                      : const Icon(
                          Icons.add_a_photo_outlined,
                          size: 100,
                          color: AppColors.primary,
                        ),
                ),
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
