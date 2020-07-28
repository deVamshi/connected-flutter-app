
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pdf_detail_screen.dart';
import 'widgets.dart';
class ListOfPdf extends StatelessWidget {
  bool isDownloaded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      appBar: buildAppBar("Python"),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return buildListTileForPdf(context);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey[200],
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}

buildListTileForPdf(BuildContext context) {
  return ListTile(
    onTap: () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) =>PdfDetail()));
      _openPopup(context);
    },
    title: Text(
      "A sample pdf file", // A sample pdf file A sample pdf file A sample pdf file A sample pdf file",
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.lato(fontSize: 15),
    ),
    //subtitle: Text("99 Upvotes",style: TextStyle(color: Color(0xff2b2f77),fontSize: 15),),
    trailing: Container(
      width: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            LineAwesomeIcons.heart,
            size: 18,
            color: Color(0xff2b2f77),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "69",
            style: TextStyle(fontSize: 15, color: Color(0xff2b2f77)),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    ),
  );
}

void _openPopup(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                // bottomSheetDetailFragment("Uploaded by ", "Vamshidhar"),
                Text(
                  "Single Phase motor.pdf",
                  style: TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10) ,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton.icon(
                    color: Colors.red,
                    onPressed: () {},
                    icon: Icon(LineAwesomeIcons.download, color: Colors.white),
                    label: Text(
                      "Download File",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10) ,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton.icon(
                    color: Colors.blue,
                    onPressed: () {},
                    icon: Icon(Icons.remove_red_eye, color: Colors.white),
                    label: Text(
                      "View Online",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Uploaded by Vamshidhar",
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10) ,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: RaisedButton.icon(
                    color: Colors.pink,
                    onPressed: () {},
                    icon: Icon(LineAwesomeIcons.heart, color: Colors.white),
                    label: Text(
                      "Say Thanks!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Text("56 Upvotes"),
              ],
            ),
          ),
        );
      });
}
