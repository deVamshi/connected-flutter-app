import 'package:Connected/Screens/profile.dart';
import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:store_redirect/store_redirect.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: NewColors.appHeaderColor),
    backgroundColor: NewColors.appBarColor,
    // blue color 0xff2b2f77
    // elevation: 0.0,
    //centerTitle: true,
    title: Text(
      title,
      style:
          GoogleFonts.lato(letterSpacing: 1, color: NewColors.appHeaderColor),
    ),
  );
}

buildDrawerItem(BuildContext bc, IconData iconData, String title) {
  return ListTile(
    onTap: () {
      if (iconData == LineAwesomeIcons.google_play) {
        StoreRedirect.redirect(androidAppId: "com.btechbuddy.notemaster");
      }
      if (iconData == LineAwesomeIcons.user) {
        Navigator.pop(bc);
        Navigator.push(
          bc,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      }
    },
    leading: Icon(
      iconData,
      color: NewColors.appHeaderColor,
    ),
    title: Text(
      "$title",
      style: GoogleFonts.lato(color: NewColors.appHeaderColor),
    ),
    trailing: Icon(
      Icons.navigate_next,
      color: NewColors.appHeaderColor,
    ),
  );
}

Drawer buildDrawer(BuildContext bc) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        Container(
          height: 180,
          //color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Icon(LineAwesomeIcons.atom,
                  size: 100, color: NewColors.appHeaderColor),
              // CircleAvatar(
              //   radius: 30,
              //   backgroundColor: Colors.black,
              //   child: Text(
              //     "N",
              //     style: TextStyle(color: Colors.white, fontSize: 30),
              //   ),
              // ),
              Text(
                "Notepedia",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: NewColors.appHeaderColor,
                ),
              ),
            ],
          ),
        ),
        Divider(),
        buildDrawerItem(bc, LineAwesomeIcons.user, "My Profile"),
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
        // ListTile(
        //   title: Text(
        //     "Dark Mode",
        //   ),
        //   trailing: Switch(
        //     value: UserPrefs.isDark,
        //     onChanged: (value) {
        //       UserPrefs.isDark = value;
        //       HiveBoxes.userPrefsHiveBox.put("isDark", value);
        //     },
        //   ),
        // ),
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

buildCustomProfileTile(IconData iconData, String value) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 60,
    child: Card(
      color: NewColors.appBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: NewColors.appHeaderColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$value",
              style: GoogleFonts.lato(
                  fontSize: 15, color: NewColors.appHeaderColor),
            ),
          ],
        ),
      ),
    ),
  );
}

// customBranchTile(BuildContext bc) {
//   return Container(
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     height: 60,
//     child: Card(
//       color: Colors.grey[100],
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(bc);
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 "ECE 1st semester",
//                 style:
//                     GoogleFonts.lato(fontSize: 15, color: AppColor.textColor),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

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
