import 'package:Connected/DatabaseMethods/crud.dart';
import 'package:Connected/Screens/upload_success.dart';
import 'package:Connected/Screens/widgets.dart';
import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool fileSelected = false;
  bool uploading = false;
  bool selecting = false;
  File selectedFile;

  _handleOnPressed() async {
    print("came");
    try {
      selectedFile = await FilePicker.getFile(
          type: FileType.custom, allowedExtensions: ["pdf"]);
      print("shit $selectedFile");
      setState(() {
        fileSelected = true;
      });
      print("gone");
      String downloadUrl = await uploadFile(selectedFile);
      print("downloadUrl: $downloadUrl");
    } catch (e) {
      print(e.toString());
    }
  }

  handleFileSelection() async {
    try {
      setState(() {
        selecting = true;
      });
      selectedFile = await FilePicker.getFile(
          type: FileType.custom, allowedExtensions: ["pdf"]);
      setState(() {
        fileSelected = true;
        selecting = false;
      });
    } catch (e) {
      print(e);
    }
  }

  handleUploading() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => UploadSuccess(),
      ),
    );
  }

  whenNoFileSelectedScreen() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selecting ? buildLinearProgress() : Text(""),
            // SizedBox(
            //   height: 50,
            // ),
            Icon(
              LineAwesomeIcons.file_upload,
              color: Colors.grey,
              size: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Select a file to upload",
                style: GoogleFonts.lato(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: RaisedButton(
                color: AppColor.mainColor,
                child: Text(
                  "Select",
                  style: GoogleFonts.lato(color: AppColor.headerColor),
                ),
                onPressed: () {
                  if (!selecting) {
                    handleFileSelection();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  whenFileSelected() {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            uploading ? buildLinearProgress() : Text(""),
            SizedBox(
              height: 20,
            ),
            Icon(
              LineAwesomeIcons.pdf_file_1,
              size: 150,
              color: Colors.red,
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                selectedFile.toString().substring(
                    selectedFile.toString().lastIndexOf("/") + 1,
                    selectedFile.toString().length - 1),
                style: GoogleFonts.lato(fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Theme(
                data: new ThemeData(
                  primaryColor: AppColor.mainColor,
                  primaryColorDark: AppColor.mainColor,
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    // fillColor: Colors.grey,

                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: OutlineInputBorder(),

                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.black, width: 1.0),
                    // ),
                    hintText: '#FirstUnit #SinglePhaseMotor',

                    // icon: Icon(LineAwesomeIcons.pdf_file_1, color: Colors.black),
                    labelText: 'Type in related tags',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: RaisedButton(
                onPressed: () {
                  handleUploading();
                },
                color: AppColor.mainColor,
                child: Text(
                  "Upload",
                  style: GoogleFonts.lato(color: AppColor.headerColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Upload file"),
      body: fileSelected && selectedFile != null
          ? whenFileSelected()
          : whenNoFileSelectedScreen(),
      // Center(
      //   child: RaisedButton(
      //     child: Text("Upload"),
      //     onPressed: () => _handleOnPressed(),
      //   ),
      // ),
    );
  }
}
