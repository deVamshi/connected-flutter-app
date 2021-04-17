import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadFunc {
  static downloadFile() async {
    Dio dio = Dio();
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;
    String downDirPath = "$appDirPath/Downloads";
    List fileList = Directory(downDirPath).listSync(recursive: false);
    print(fileList);
    if (await Permission.storage.request().isGranted) {
      bool exists = await Directory("$appDirPath/Downloads").exists();
      if (!exists) {
        await new Directory("$appDirPath/Downloads")
            .create(recursive: false)
            .then((Directory dir) {
          print(dir.path);
          downDirPath = dir.path;
        });
        await dio.download(
            "https://github.com/VamshidharTelugu/question-bank/raw/master/1.%20TTLA-%20MID-I-converted.pdf",
            "$downDirPath/oshit.pdf", onReceiveProgress: (int rec, int total) {
          print("rec $rec of total $total");
        });
        print("completed");
      } else {
        await dio.download(
            "https://github.com/VamshidharTelugu/question-bank/raw/master/1.%20TTLA-%20MID-I-converted.pdf",
            "$downDirPath/oshit.pdf", onReceiveProgress: (int rec, int total) {
          print("rec $rec of total $total");
        });
        print("completed");
      }
    }
    fileList = Directory(downDirPath).listSync(recursive: false);
    print(fileList);
  }
}
