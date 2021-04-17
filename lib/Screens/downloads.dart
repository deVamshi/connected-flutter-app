import 'package:Connected/Screens/widgets.dart';
import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
    super.initState();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    return downloadedFiles.length == 0
        ? buildEmptyScreen(LineAwesomeIcons.download, "No downloads found")
        : _buildListViewForDownloadedFile();
  }

  _buildListViewForDownloadedFile() {
    return 
    // Scaffold(
    //   appBar: buildAppBar("Downloads"),
    //   backgroundColor: Colors.transparent,
    //   body:
       ListView.separated(
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
              LineAwesomeIcons.file_pdf_o,
              color: Colors.red,
              size: 25,
            ),
            trailing: PopupMenuButton<String>(
              // color: Colors.grey[200],
              onSelected: (value) {},

              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text("Delete from downloads"),
                    value: "delete",
                  )
                ];
              },
            ),
            title: Text(
              "${downloadedFiles[index]}",
              style:
                  GoogleFonts.lato(color: NewColors.downloadsPageTileTextColor),
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      );
    // );
  }
}
