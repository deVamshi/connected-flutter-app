import 'package:Connected/Screens/widgets.dart';
import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  List<String> downloadedFiles = [
    "A sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf",
    "a sample pdf file again.pdf"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
  }

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
            : _buildListViewForDownloadedFile();
  }

  _buildListViewForDownloadedFile() {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.black),
        child: ListView.separated(
          itemCount: downloadedFiles.length,
          separatorBuilder: (_, index) {
            return Divider();
          },
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () {
                print("implement show pdf functionn");
              },
              leading: Icon(
                LineAwesomeIcons.pdf_file,
                color: Colors.red,
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  print("implementing delete function");
                },
                itemBuilder: (_) {
                  return [
                    PopupMenuItem(
                      child: Text("Delete from downloads"),
                      value: "delete",
                    )
                  ];
                },
              ),
              // IconButton(
              //     icon: Icon(
              //       Icons.more_vert,
              //     ),
              //     onPressed: () {
              //       PopupMenuButton()

              //     }),
              title: Text(
                "${downloadedFiles[index]}",
                style: GoogleFonts.lato(),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
