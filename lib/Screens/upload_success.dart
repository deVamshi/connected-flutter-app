import 'package:Connected/Screens/upload_screen.dart';
import 'package:Connected/Screens/widgets.dart';
import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class UploadSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar("Upload file"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              LineAwesomeIcons.check_circle,
              color: Colors.green,
              size: 150,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Upload Successful",
              style: GoogleFonts.lato(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,

            ),
            // Divider(),
            Text("It will go live once we review it",style: TextStyle(color: Colors.grey),),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: RaisedButton(
                child: Text(
                  "Done",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                color: NewColors.appBarColor,
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadScreen(),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            // Container(
            //   width: 200,
            //   child: RaisedButton(
            //     child: Text(
            //       "Upload another",
            //       style: GoogleFonts.lato(color: AppColor.headerColor),
            //     ),
            //     color: Colors.grey,
            //     onPressed: () => Navigator.pop(context),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
