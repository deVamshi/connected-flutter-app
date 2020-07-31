import 'package:Connected/DatabaseMethods/auth.dart';
import 'package:Connected/Screens/upload_screen.dart';
import 'package:Connected/colors.dart';
import 'package:Connected/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';

class ListOfPdf extends StatefulWidget {
  @override
  _ListOfPdfState createState() => _ListOfPdfState();
}

class _ListOfPdfState extends State<ListOfPdf> {
  bool isDownloaded = true;
  bool thanked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: buildAppBar("Python"),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
              child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return buildListTileForPdf(context);
          },
          // separatorBuilder: (context, index) {
          //   return Container(
          //     color: Colors.grey[200],
          //     height: 1,
          //     margin: EdgeInsets.symmetric(horizontal: 10),
          //   );
          // },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.mainColor,
        child: Icon(
          LineAwesomeIcons.plus,
          color: AppColor.headerColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadScreen(),
            ),
          );
        },
      ),
    );
  }

  // _signUpBottomSheet(BuildContext bc) {
  //   showModalBottomSheet(
  //       context: bc,
  //       isScrollControlled: true,
  //       backgroundColor: Colors.white,
  //       builder: (BuildContext bc) {
  //         return Container(
  //           padding: EdgeInsets.symmetric(horizontal: 30),
  //           height: MediaQuery.of(bc).size.height * 0.45,
  //           child: Center(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 // bottomSheetDetailFragment("Uploaded by ", "Vamshidhar"),
  //                 Text(
  //                   "To upload files or thank others...",
  //                   style: TextStyle(fontSize: 18),
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //                 Divider(),
  //                 Text(
  //                   "Join the community!",
  //                   style: TextStyle(fontSize: 20, color: Colors.red),
  //                   overflow: TextOverflow.clip,
  //                 ),
  //                 SizedBox(
  //                   height: 18,
  //                 ),
  //                 InkWell(
  //                   onTap: () async {
  //                     String result = await signInWithGoogle();
  //                     print("result: $result");
  //                     print("Ended");
  //                     Navigator.pop(context);

  //                     setState(() {
  //                       Contants.isAuth = true;
  //                     });
  //                     _openPopup(context);

  //                     // bool result = await login();
  //                     // if (result) {
  //                     //   setState(() {
  //                     //     Contants.isAuth = true;
  //                     //   });
  //                     //   Navigator.pop(context);
  //                     //   _openPopup(context);
  //                     // } else {
  //                     //   setState(() {
  //                     //     Contants.isAuth = false;
  //                     //   });
  //                     //   print("An error occured signin");
  //                     // }
  //                   },
  //                   child: Container(
  //                     // padding: EdgeInsets.symmetric(horizontal: 10) ,
  //                     height: 40,
  //                     width: 220,
  //                     decoration: BoxDecoration(
  //                       color: Colors.red,
  //                       border: Border.all(color: Colors.blueAccent),
  //                       image: DecorationImage(
  //                           image: AssetImage("assets/images/googlee.png"),
  //                           fit: BoxFit.cover),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Divider(
  //                   color: Colors.grey,
  //                 ),
  //                 Text(
  //                   "*In order to prevent unintended activities, We need to authenticate the users",
  //                   style: TextStyle(fontSize: 10, color: Colors.grey),
  //                   overflow: TextOverflow.clip,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

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
                      icon:
                          Icon(LineAwesomeIcons.download, color: Colors.white),
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
                      color: thanked ? Colors.grey : Colors.pink,
                      onPressed: () {
                        // Contants.isLoggedIn ? print("allowd") : _signUpBottomSheet(context);

                        if (!thanked) {
                          Navigator.pop(context);
                          thanked = true;
                        }

                        // _openPopup(context);
                        // if (Contants.isAuth) {
                        //   print("allowed");
                        //   print("the value of auth is ${Contants.isAuth}");
                        // } else {
                        //   Navigator.pop(context);
                        //   print("the value of auth is ${Contants.isAuth}");
                        //   _signUpBottomSheet(context);
                        // }
                      },
                      icon: Icon(LineAwesomeIcons.heart, color: Colors.white),
                      label: Text(
                        thanked ? "Thanked!" : "Say Thanks!",
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

  buildListTileForPdf(BuildContext bc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: AppColor.tileColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>PdfDetail()));

                _openPopup(bc);
              },
              // leading:
              // IconButton(icon: Icon(LineAwesomeIcons.thumbs_up,color: Colors.black,),onPressed: (){},iconSize: 30,),
              // Container(
              //   width: 40,
              //   child: C(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     // mainAxisAlignment: MainAxisAlignment.end,
              //     children: <Widget>[
              //       IconButton(
              //         LineAwesomeIcons.thumbs_up,
              //         color: Colors.indigo,
              //         size: 15,
              //       ),

              //       Text(
              //         "54",
              //         style: TextStyle(
              //           fontSize: 15,
              //           color: Colors.grey,
              //         ),
              //       ),
              //       // Icon(
              //       //   LineAwesomeIcons.arrow_down,
              //       //   color: Colors.indigo,
              //       //   size: 15,
              //       // ),
              //       // SizedBox(
              //       //   width: 5,
              //       // ),
              //       // Text(
              //       //   "people found this useful",
              //       //   style: TextStyle(fontSize: 15, color: Colors.grey),
              //       // ),
              //     ],
              //   ),
              // ),
              title: Text(
                "A sample pdf file", // A sample pdf file A sample pdf file A sample pdf file A sample pdf file",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(fontSize: 20),
              ),
              subtitle: Text(
                "#single phase motors #unit1 #bybharadwajsir",
                style:
                    GoogleFonts.lato(fontSize: 12, color: AppColor.textColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FlatButton.icon(
                    color: AppColor.mainColor,
                    onPressed: () {},
                    icon: Icon(
                      LineAwesomeIcons.thumbs_up,
                      color: AppColor.headerColor,
                    ),
                    label: Text(
                      "56",
                      style: GoogleFonts.lato(color: AppColor.headerColor),
                    ),
                  ),
                ),
                Text(
                  "Uploaded by tejesh",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
