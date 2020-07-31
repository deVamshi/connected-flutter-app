import 'package:Connected/DatabaseMethods/auth.dart';
import 'package:Connected/Screens/profile.dart';
import 'package:Connected/colors.dart';
import 'package:Connected/constants.dart';
import 'package:Connected/userPrefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:store_redirect/store_redirect.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColor.headerColor),
    backgroundColor: AppColor.mainColor,
    // blue color 0xff2b2f77
    elevation: 0.0,
    //centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.lato(letterSpacing: 0.5, color: AppColor.headerColor),
    ),
  );
}

// buildChoiceChip(
//   BuildContext context,
// ) {
//   return Container(
//     margin: EdgeInsets.symmetric(
//       horizontal: 5,
//     ),
//     width: MediaQuery.of(context).size.width * 0.55,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
//     child: Center(
//       child: Text(
//         "ECE",
//         style: GoogleFonts.lato(
//           color: Colors.black,
//           fontSize: 20,
//         ),
//       ),
//     ),
//   );
// }

buildDrawerItem(BuildContext bc, IconData iconData, String title) {
  return ListTile(
    onTap: () {
      if (iconData == LineAwesomeIcons.google_play) {
        StoreRedirect.redirect(androidAppId: "com.btechbuddy.notemaster");
      }
      if (iconData == LineAwesomeIcons.user) {
        Navigator.push(
            bc, MaterialPageRoute(builder: (context) => ProfileScreen()));
      }
    },
    leading: Icon(
      iconData,
      color: AppColor.textColor,
    ),
    title: Text(
      "$title",
      style: TextStyle(color: AppColor.textColor),
    ),
    trailing: Icon(
      Icons.navigate_next,
      color: AppColor.textColor,
    ),
  );
}

Drawer buildDrawer(BuildContext bc) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        // Contants.isAuth
        //     ? Container(
        //         height: 150,
        //         //color: Colors.black,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: <Widget>[
        //             SizedBox(
        //               height: 10,
        //             ),
        //             CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Color(0xff2b2f77),
        //               child: Text(
        //                 "V",
        //                 style: TextStyle(color: Colors.white, fontSize: 30),
        //               ),
        //             ),
        //             Text(
        //               "Vamshidhar",
        //               overflow: TextOverflow.ellipsis,
        //               style: GoogleFonts.lato(
        //                 fontSize: 20,
        //               ),
        //             ),
        //             Text(
        //               "telugvamshi77@gmail.com",
        //               overflow: TextOverflow.ellipsis,
        //               style: GoogleFonts.lato(
        //                 fontSize: 10,
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //:
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
                backgroundColor: Colors.black,
                child: Text(
                  "N",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Text(
                "Notepedia",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Divider(),
        buildDrawerItem(bc, LineAwesomeIcons.wrench, "Settings"),
        // ListTile(
        //   onTap: () async {
        //     UserPrefs.isDark = true;
        //     Phoenix.rebirth(bc);
        //   },
        //   leading: Icon(
        //     LineAwesomeIcons.sun_1,
        //     color: AppColor.textColor,
        //   ),
        //   title: Text(
        //     "Dark Mode",
        //     style: TextStyle(color: AppColor.textColor),
        //   ),
        //   trailing: Text(
        //     "Off",
        //     style: TextStyle(color: AppColor.textColor),
        //   ),
        // ),
        // Divider(),
        buildDrawerItem(bc, LineAwesomeIcons.google_play, "Rate on Playstore"),
        buildDrawerItem(bc, LineAwesomeIcons.user_friends, "Invite friends"),
        Divider(),
        buildDrawerItem(bc, LineAwesomeIcons.comments, "Contact Us"),
        buildDrawerItem(bc, LineAwesomeIcons.file_contract, "Privacy Policy"),
      ],
    ),
  );
}

buildEmptyScreen(IconData iconData, String text) {
  return Scaffold(
    backgroundColor: AppColor.bgColor,
    body: Center(
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
    ),
  );
}

buildCustomProfileTile(String title, String value) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 60,
    child: Card(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Text(
              "$title",
              style: GoogleFonts.lato(fontSize: 15, color: AppColor.textColor),
            ),
            Spacer(),
            Text(
              "$value",
              style: GoogleFonts.lato(fontSize: 15, color: AppColor.textColor),
            ),
          ],
        ),
      ),
    ),
  );
}

customBranchTile(BuildContext bc) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 60,
    child: Card(
      color: Colors.grey[100],
      child: InkWell(
        onTap: () {
          Navigator.pop(bc);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Text(
                "ECE 1st semester",
                style:
                    GoogleFonts.lato(fontSize: 15, color: AppColor.textColor),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

buildLinearProgress() {
  return Container(
    // padding: EdgeInsets.only(bottom: 20),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(AppColor.mainColor),
      backgroundColor: Colors.transparent,
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
