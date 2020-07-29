import 'package:Connected/DatabaseMethods/crud.dart';
import 'package:Connected/Screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';



class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}




class _UploadScreenState extends State<UploadScreen> {
  bool imageSelected = false;

  
  _handleOnPressed() async {
    print("came");
    try {
      File file = await FilePicker.getFile(
          type: FileType.custom, allowedExtensions: ["pdf"]);
      print("shit $file");
      print("gone");
      String downloadUrl = await uploadFile(file);
      print("downloadUrl: $downloadUrl");
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Upload file"),
      body: Center(
        child: RaisedButton(
          child: Text("Upload"),
          onPressed: () => _handleOnPressed(),
        ),
      ),
    );
  }
}
