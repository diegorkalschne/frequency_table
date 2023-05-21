import 'package:file_picker_cross/file_picker_cross.dart';

class FilePickerService {
  static Future<FilePickerCross?> filePicker() async {
    final file = await FilePickerCross.importFromStorage(
      fileExtension: 'txt, xlsx',
      type: FileTypeCross.custom,
    );

    return file;
  }
}
