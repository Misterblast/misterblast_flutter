import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> pickImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? imageFile = await picker.pickImage(
    source: source,
    imageQuality: 100,
  );
  if (imageFile == null) return null;
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  );
  return croppedFile?.path;
}
