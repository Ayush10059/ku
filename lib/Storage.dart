import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Storage {
  String fileName = '';
  Storage(String fName) {
    fileName=fName;
  }
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    print(path.toString());
    return File('$path/$fileName');
  }
  Future<String> readData() async {
    try {
      final file = await localFile;
      String body = await file.readAsString();
      return body;
    } catch (e) {
      return e.toString();
    }
  }
  Future<File> writeData(String data) async {
    final file = await localFile;
    return file.writeAsString("$data");
  }
}