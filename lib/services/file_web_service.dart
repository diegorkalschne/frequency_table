import 'dart:convert' show utf8;
import 'dart:typed_data';

class FileWebService {
  static Future<String> readText(Uint8List bytes) async {
    return utf8.decode(bytes);
  }
}
