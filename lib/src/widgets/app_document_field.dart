import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/utils/pick_file.dart';

class AppDocumentField extends StatelessWidget {
  const AppDocumentField(
      {super.key, this.label, this.filePickerResult, this.onFileSelected});

  final String? label;
  final FilePickerResult? filePickerResult;
  final Function(FilePickerResult?)? onFileSelected;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        final result = await pickFile();
        if (result != null && onFileSelected != null) {
          onFileSelected!(result);
        }
      },
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          if (filePickerResult == null)
            Container(
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: theme.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload_file, color: theme.colorScheme.primary),
                  Text(
                    context.tr("common.select-file"),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: theme.colorScheme.primary),
                  ),
                ],
              ),
            ),
          if (filePickerResult != null)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: theme.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          size: 24,
                          Icons.description,
                          color: theme.colorScheme.primary,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filePickerResult!.files.first.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              '${(filePickerResult!.files.first.size / 1024).floor()} KB',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (onFileSelected != null) {
                        onFileSelected!(null);
                      }
                    },
                    icon: Icon(Icons.close, color: theme.colorScheme.primary),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
