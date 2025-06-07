import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageSourceDialog extends StatelessWidget {
  const SelectImageSourceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text(
        'Pick an image',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              title: const Text('Camera'),
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.camera),
              onTap: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              title: const Text('Gallery'),
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.image),
              onTap: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
            ),
          ),
        ],
      ),
    );
  }
}
