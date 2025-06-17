import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/utils/is_string_url.dart';
import 'package:misterblast_flutter/src/utils/pick_image.dart';
import 'package:misterblast_flutter/src/widgets/select_image_source_dialog.dart';

class CircleImageField extends StatelessWidget {
  const CircleImageField({
    super.key,
    required this.onImageSelected,
    required this.filePath,
    this.width = 200,
    this.height = 200,
  });

  final double? width;
  final double? height;

  final Function(String? p1)? onImageSelected;
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: height,
            width: width,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
              image: filePath != null
                  ? DecorationImage(
                      image: filePath!.isUrl
                          ? NetworkImage(filePath!)
                          : FileImage(File(filePath!)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: filePath != null
                ? null
                : const Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColors.primary,
                  ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.primary,
              ),
            ),
            padding: const EdgeInsets.all(4),
            child: Icon(
              size: 20,
              Icons.edit,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
