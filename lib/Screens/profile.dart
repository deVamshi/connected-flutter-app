import 'package:Connected/DatabaseMethods/auth.dart';
import 'package:Connected/Screens/widgets.dart';
import 'package:Connected/Views/EditProfileScreen.dart';
import 'package:Connected/colors.dart';
import 'package:Connected/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "Vamshidhar Telugu";
  String rollNumber = "19121A04M2";
  String institute = "Sree Vidyanikethan";
  String stream = "Btech";
  String branch = "ECE";
  String year = "1";
  String section = "D";
  String avatarPath = "assets/images/5.jpg";

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    var avatar = Container(
      //color: Color(0xffdde7ee),
      height: 130,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CircleAvatar(
            radius: 50.5,
            backgroundColor: AppColor.textColor,
            child: InkWell(
              onTap: () {
                _neverSatisfied();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(avatarPath),
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: buildAppBar("My Profile"),
      body: Contants.isAuth
          ? ListView(
              children: <Widget>[
                avatar,
                // Divider(color: Colors.white,),

                buildCustomProfileTile("Name", "Vamshidhar"),
                buildCustomProfileTile("Email", "teluguvamshi77@gmail.com"),
                buildCustomProfileTile("Branch", "ECE"),
                Divider(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  height: 40,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: RaisedButton.icon(
                    color: AppColor.mainColor,
                    onPressed: () async {
                      signOutGoogle();
                      print("signed out");
                      setState(() {
                        Contants.isAuth = false;
                      });
                    },
                    icon: Icon(LineAwesomeIcons.alternate_sign_out,
                        color: Colors.white),
                    label: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          : _signUpScreen(),
    );
  }

  _signUpScreen() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            LineAwesomeIcons.user_circle_1,
            size: 150,
            color: Colors.grey,
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            child: RaisedButton(
              color: AppColor.mainColor,
              onPressed: () {},
              child: Text(
                "Sign Up",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Text("By signing up you can upload files and thank others!")
          // isDownloadsPage ? FlatButton(color: Colors.red,child: Text("Refresh"),)
        ],
      ),
    );
  }

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
