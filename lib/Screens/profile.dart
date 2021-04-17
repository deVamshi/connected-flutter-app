import 'package:Connected/DatabaseMethods/auth.dart';
import 'package:Connected/Screens/widgets.dart';
import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'JoinScreen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String avatarPath = "assets/images/16.jpg";

  // bool isDark = false;

  @override
  void initState() {
    super.initState();
    // isDark = UserPrefs.isDark;
  }

  _setLogInState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isAuth", false);
  }

  @override
  Widget build(BuildContext context) {
    var avatar = Container(
      //color: Color(0xffdde7ee),
      // color: Colors.white,
      height: 150,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              _neverSatisfied();
            },
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(avatarPath),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.grey[100],
        // NewColors.scaffoldBgColor,
        // backgroundColor: Colors.grey[900],
        appBar: buildAppBar("Account"),
        body: ListView(
          children: <Widget>[
            avatar,
            Center(
              child: Text(
                "Vamshidhar Telugu",
                style: GoogleFonts.lato(
                    fontSize: 22, color: NewColors.appHeaderColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "My Details",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: NewColors.appHeaderColor),
              ),
            ),
            // buildCustomProfileTile(LineAwesomeIcons.user, "Vamshidhar Telugu"),
            buildCustomProfileTile(
                LineAwesomeIcons.envelope, "teluguvamshi77@gmail.com"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              // color: AppColor.bgColor,
              // height: 50.0,
              child: Text(
                "App",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: NewColors.appHeaderColor),
              ),
            ),
            buildCustomProfileTile(
                LineAwesomeIcons.google_play, "Rate on playstore"),
            buildCustomProfileTile(
                LineAwesomeIcons.comment, "Your feedback matters"),
            buildCustomProfileTile(
                LineAwesomeIcons.user_friends, "Share with friends"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              // color: AppColor.bgColor,
              // height: 50.0,
              child: Text(
                "Support",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: NewColors.appHeaderColor),
              ),
            ),
            buildCustomProfileTile(LineAwesomeIcons.comments, "Contact Us"),
            buildCustomProfileTile(
                LineAwesomeIcons.file_contract, "Privacy Policy"),
            Divider(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              child: Card(
                color: NewColors.homePageTileColor,
                child: InkWell(
                  onTap: () {
                    signOutGoogle().whenComplete(() async {
                      // await setLogInStateHiveBox();
                      await _setLogInState();
                      print("compledted");
                      // setLogInState();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return JoinScreen();
                          },
                        ),
                      );
                    }).catchError((e) => print(e));
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          "Log out",
                          style:
                              GoogleFonts.lato(fontSize: 18, color: Colors.red),
                        ),
                      ),),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            // buildCustomProfileTile("Branch", "ECE"),
            // Spacer(),

            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 50),
            //   height: 40,
            //   // width: MediaQuery.of(context).size.width * 0.5,
            //   child: RaisedButton.icon(
            //     color: AppColor.mainColor,
            //     onPressed: () async {
            //       // if (UserPrefs.isDark) {
            //       //   UserPrefs.isDark = false;
            //       //   HiveBoxes.userPrefsHiveBox.put("isDark", false);
            //       //   Phoenix.rebirth(context);
            //       // } else {
            //       //   UserPrefs.isDark = true;
            //       //   HiveBoxes.userPrefsHiveBox.put("isDark", true);
            //       //   Phoenix.rebirth(context);
            //       // }
            //       // print(UserPrefs.isDark);
            //     },
            //     icon: Icon(LineAwesomeIcons.alternate_sign_out,
            //         color: Colors.white),
            //     label: Text(
            //       "Log Out",
            //       style: TextStyle(color: AppColor.headerColor),
            //     ),
            //   ),
            // ),
          ],
        )
        // : _signUpScreen(),
        );
  }

  // _signUpScreen() {
  //   return Center(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Icon(
  //           LineAwesomeIcons.user_circle_1,
  //           size: 150,
  //           color: Colors.grey,
  //         ),

  //         SizedBox(
  //           height: 10,
  //         ),
  //         Container(
  //           width: 200,
  //           child: RaisedButton(
  //             color: AppColor.mainColor,
  //             onPressed: () {},
  //             child: Text(
  //               "Sign Up",
  //               style: GoogleFonts.lato(
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         ),
  //         // Text("By signing up you can upload files and thank others!")
  //         // isDownloadsPage ? FlatButton(color: Colors.red,child: Text("Refresh"),)
  //       ],
  //     ),
  //   );
  // }

  Future<Null> _neverSatisfied() async {
    return showDialog<Null>(
        context: context,
        // barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            // contentPadding: const EdgeInsets.all(10.0),
            title: new Text(
              'Avatars',
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            content: new Container(
              // Specify some width
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.7,
              //width: MediaQuery.of(context).size.width ,
              child: new GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  // padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 4.0,
                  children: <String>[
                    'assets/images/18.jpg',
                    'assets/images/11.jpg',
                    'assets/images/17.jpg',
                    'assets/images/12.jpg',
                    'assets/images/13.jpg',
                    'assets/images/14.jpg',
                    'assets/images/15.jpg',
                    'assets/images/16.jpg',
                    //'assets/images/e1.jpg',

                    // 'assets/images/31.jpg',
                    // 'assets/images/36.jpg',
                  ].map((String path) {
                    return GridTile(
                        child: GestureDetector(
                      onTap: () {
                        print("$path");
                        setState(() {
                          avatarPath = path;
                        });

                        Navigator.of(context).pop();
                      },
                      child: new Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: 12.0,
                        height: 12.0,
                      ),
                    ));
                  }).toList()),
            ),
          );
        });
  }
}
