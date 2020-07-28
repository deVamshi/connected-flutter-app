import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'pdf_detail_screen.dart';




AppBar buildAppBar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xff2b2f77),
    // blue color 0xff2b2f77
    elevation: 0.0,
    //centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.lato(letterSpacing: 2, color: Colors.white),
    ),
  );
}




buildChoiceChip(
  BuildContext context,
) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 5,
    ),
    width: MediaQuery.of(context).size.width * 0.55,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
    child: Center(
      child: Text(
        "ECE",
        style: GoogleFonts.lato(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    ),
  );
}

buildDrawerItem(IconData iconData, String title) {
  return ListTile(
    onTap: () {},
    leading: Icon(iconData),
    title: Text("$title"),
    trailing: IconButton(
      icon: Icon(Icons.navigate_next),
      onPressed: () {
        print("implement profile edit");
      },
    ),
  );
}

Drawer buildDrawer() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        Container(
          height: 150,
          //color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff2b2f77),
                child: Text(
                  "V",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Text(
                "Vamshidhar",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[500],
        ),
        buildDrawerItem(LineAwesomeIcons.user, "Profile"),
        buildDrawerItem(LineAwesomeIcons.google_play, "Rate on Playstore"),
        buildDrawerItem(Icons.group_add, "Invite friends"),
        buildDrawerItem(Icons.feedback, "Contact Us"),
        buildDrawerItem(Icons.help_outline, "About Us"),
      ],
    ),
  );
}

buildEmptyScreen(IconData iconData, String text) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 100,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$text",
          style: GoogleFonts.lato(fontSize: 20, color: Colors.grey),
        ),
        // isDownloadsPage ? FlatButton(color: Colors.red,child: Text("Refresh"),)
      ],
    ),
  );
}

// bottomSheetDetailFragment(String title, String value) {
//     return Row(
//       children: <Widget>[
//         Text(
//           "$title",
//           style: GoogleFonts.lato(fontSize: 15),
//         ),
//         // Spacer(),
//         Text(
//           "$value",
//           style: GoogleFonts.lato(fontSize: 15),
//         ),
//       ],
//     );
//   }

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
