import 'package:Connected/Screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Downloads extends StatelessWidget {
  List<String> downloadedFiles = [
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again",
    "a sample pdf file again"
  ];
  @override
  Widget build(BuildContext context) {
    return
        // ValueListenableBuilder<String>(

        //     valueListenable:  downloadedFiles.toList(),
        //     builder: (BuildContext context, dynamic value, Widget child) {
        //        return  Container();
        //     },
        //  ),

        downloadedFiles.length == 0
            ? buildEmptyScreen(LineAwesomeIcons.download, "No downloads found")
            : ListView.builder(
                itemCount: downloadedFiles.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Icon(LineAwesomeIcons.pdf_file),
                    title: Text("${downloadedFiles[index]}"),
                  );
                },
              );
  }
}
