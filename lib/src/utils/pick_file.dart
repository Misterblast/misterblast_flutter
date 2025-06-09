import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> pickFile() async {
  return await FilePicker.platform.pickFiles();
}
