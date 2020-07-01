import 'package:Connected/Views/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:store_redirect/store_redirect.dart';
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
  // String collegeSelected;
  // String branchSelected;
  // String sectionSelected;
  //bool isButtonVisible = false;
  //ScrollController controller = ScrollController();
  //TextEditingController _textEditingController = TextEditingController();
  //String _currentSelectedValue = "";
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
  ];

  @override
  Widget build(BuildContext context) {
    // var profileInfo = Container(
    //   color: Color(0xffdde7ee),
    //   height: 130,
    //   width: MediaQuery.of(context).size.width,

    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //      children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: CircleAvatar(
    //           radius: 60,
    //           backgroundColor: Colors.black,
    //           child: CircleAvatar(
    //             radius: 55,
    //             backgroundImage: AssetImage('$avatarPath'),
    //           ),
    //         ),
    //       ),
    //     // SizedBox(height: 10),
    //       // Text(
    //       //       '$username',
    //       //       style: TextStyle(
    //       //           fontSize: 20, fontWeight: FontWeight.w600), //kTitleTextStyle,
    //       //     ),
    //       // Column(
    //       //   crossAxisAlignment: CrossAxisAlignment.start,
    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //   children: <Widget>[
    //       //     Text(
    //       //       '$username',
    //       //       style: TextStyle(
    //       //           fontSize: 20, fontWeight: FontWeight.w600), //kTitleTextStyle,
    //       //     ),
    //       //       Text(
    //       //   '$rollNumber',
    //       //   style: TextStyle(
    //       //       fontSize: 15, fontWeight: FontWeight.w600), //kCaptionTextStyle,
    //       // ),
    //       //   ],
    //       // ),
    //      // SizedBox(height: 5),
    //       Text(
    //         '$username',
    //         style: TextStyle(
    //             fontSize: 15, fontWeight: FontWeight.w600), //kCaptionTextStyle,
    //       ),
    //     // SizedBox(height: 10)
    //     ],
    //   ),
    // );
    // var header = Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //    // profileInfo,
    //   ],
    // );
    var avatar = Container(
      //color: Color(0xffdde7ee),
      height: 130,

      // margin: EdgeInsets.only(right: 15),
      //color: Colors.red,
      // decoration: BoxDecoration(border: Border.all()),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CircleAvatar(
            radius: 51,
            backgroundColor: Color(0xff2b2f77),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
       // elevation: 0,
        title: Text("My Profile",),
        backgroundColor: Color(0xff2b2f77),
        actions: <Widget>[
          
          PopupMenuButton(
            //color: Color(0xff2b2f77),
            itemBuilder: (BuildContext context) {
              return [
                //   PopupMenuItem(child:  ListTile(

                //   onTap: () {
                //     StoreRedirect.redirect(
                //         androidAppId: "com.btechbuddy.notemaster");
                //   },
                //  // leading: Icon(LineAwesomeIcons.google_play),
                //   title: Text("Rate On Playstore"),
                // ),),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                          StoreRedirect.redirect(
                              androidAppId: "com.btechbuddy.notemaster");
                        },
                    child: Text("Rate On Playstore"),
                  ),
                ),
                PopupMenuItem(child: Text("Feed Back")),
                PopupMenuItem(child: Text("Invite a friend"))
              ];
            },
          )
        ],
      ),
      //Color(0xffdde7ee),
      //drawer: Drawer(),

      //appBar:
      //  AppBar(
      //   elevation: 0,
      //   title: Text("Connect"),
      // ),

      // backgroundColor: Color(0xff81a5ba),
      body: ListView(
        children: <Widget>[
          avatar,
          // Divider(color: Colors.white,),
          customListViewForProfile("Name", username, LineAwesomeIcons.user),

          // Divider(color: Colors.white,),
          // Divider(color: Colors.blueGrey,),
          // customListViewForProfile("Name", username),
          // customListViewForProfile("Roll Number", rollNumber),
          customListViewForProfile(
              "Roll Number", rollNumber, LineAwesomeIcons.identification_badge),
          // Divider(color: Colors.white,),

          // Divider(color: Colors.blueGrey,),
          customListViewForProfile(
              "Institute", institute, LineAwesomeIcons.graduation_cap),
          // Divider(color: Colors.blueGrey,height: 0,),
          // customListViewForProfile(
          //   "Stream",
          //   stream,
          // ),
          // Divider(color: Colors.blueGrey,),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: customListViewForProfile(
                      "Stream", stream, LineAwesomeIcons.drafting_compass),
                ),
                //Divider(color: Colors.blueGrey,height: 2,),
                Expanded(
                    flex: 1,
                    child: customListViewForProfile(
                        "Year", year, LineAwesomeIcons.dice_d6)),
              ],
            ),
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: customListViewForProfile(
                      "Branch", branch, LineAwesomeIcons.atom),
                ),
                //Divider(color: Colors.blueGrey,height: 2,),

                Expanded(
                    flex: 1,
                    child: customListViewForProfile(
                        "Section", section, LineAwesomeIcons.stream))
              ],
            ),
          ),
        ],
      ),

      // CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       backgroundColor: Color(0xff2b2f77),
      //       title: Text("My Profile"),
      //       // actions: <Widget>[
      //       //    Drawer(),
      //       // ],

      //       // pinned: true,
      //       // expandedHeight: 200.0,
      //       // title: Text("My Profile"),
      //       // flexibleSpace: FlexibleSpaceBar(

      //       //   background: Column(children: <Widget>[
      //       //     SizedBox(height: 50,),
      //       //     avatar,

      //       //     Text(username)
      //       //   ],),
      //       //   // Image.asset(
      //       //   //   'assets/images/vectorr.jpg',
      //       //   //   fit: BoxFit.fill,
      //       //   // ),
      //       // ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildListDelegate([
      //         // Container(height: 150,child: Row(
      //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //   children: <Widget>[
      //         //     Column(
      //         //       crossAxisAlignment: CrossAxisAlignment.start,
      //         //       children: <Widget>[
      //         //        Expanded(child: customListViewForProfile("Name", username)),
      //         //        Expanded(child: customListViewForProfile("Roll Number", rollNumber)),

      //         //     ],),

      //         //   avatar,
      //         // //  SizedBox(width: 3,)

      //         // ],),),
      //         avatar,
      //         // Divider(color: Colors.white,),
      //         customListViewForProfile("Name", username, LineAwesomeIcons.user),

      //         // Divider(color: Colors.white,),
      //         // Divider(color: Colors.blueGrey,),
      //         // customListViewForProfile("Name", username),
      //         // customListViewForProfile("Roll Number", rollNumber),
      //         customListViewForProfile("Roll Number", rollNumber,
      //             LineAwesomeIcons.identification_badge),
      //         // Divider(color: Colors.white,),

      //         // Divider(color: Colors.blueGrey,),
      //         customListViewForProfile(
      //             "Institute", institute, LineAwesomeIcons.graduation_cap),
      //         // Divider(color: Colors.blueGrey,height: 0,),
      //         // customListViewForProfile(
      //         //   "Stream",
      //         //   stream,
      //         // ),
      //         // Divider(color: Colors.blueGrey,),
      //         Container(
      //           height: 70,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: <Widget>[
      //               Expanded(
      //                 flex: 1,
      //                 child: customListViewForProfile(
      //                     "Stream", stream, LineAwesomeIcons.drafting_compass),
      //               ),
      //               //Divider(color: Colors.blueGrey,height: 2,),
      //               Expanded(
      //                   flex: 1,
      //                   child: customListViewForProfile(
      //                       "Year", year, LineAwesomeIcons.dice_d6)),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           height: 70,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: <Widget>[
      //               Expanded(
      //                 flex: 1,
      //                 child: customListViewForProfile(
      //                     "Branch", branch, LineAwesomeIcons.atom),
      //               ),
      //               //Divider(color: Colors.blueGrey,height: 2,),

      //               Expanded(
      //                   flex: 1,
      //                   child: customListViewForProfile(
      //                       "Section", section, LineAwesomeIcons.stream))
      //             ],
      //           ),
      //         ),
      //       ]),
      //       //     SliverChildBuilderDelegate((BuildContext context, int index) {
      //       //   return customListViewForProfile("Name", username);
      //       // }, childCount: 6),
      //     )
      //   ],
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       Container(
      //           height: 150,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage("assets/images/mountain.jpg"),
      //                   fit: BoxFit.cover))),
      //       ListTile(
      //         onTap: () {
      //           StoreRedirect.redirect(
      //               androidAppId: "com.btechbuddy.notemaster");
      //         },
      //         leading: Icon(LineAwesomeIcons.google_play),
      //         title: Text("Rate On Playstore"),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.feedback),
      //         title: Text("Feedback"),
      //       ),
      //       ListTile(
      //         leading: Icon(LineAwesomeIcons.user_plus),
      //         title: Text("Invite a Friend"),
      //       ),
      //       ListTile(
      //         leading: Icon(LineAwesomeIcons.alternate_sign_out),
      //         title: Text("Log Out"),
      //       ),
      //     ],
      //   ),
      // ),

      //  ListView(
      //   children: <Widget>[
      //     // SizedBox(
      //     //   height: 20,
      //     // ),
      //     // header,

      //     avatar,
      //   //  Divider(
      //      // color: Colors.blueGrey,
      //     //),

      //   customListViewForProfile("Name", username),
      //  // Divider(color: Colors.blueGrey,),
      //   // customListViewForProfile("Name", username),
      //   // customListViewForProfile("Roll Number", rollNumber),
      //   customListViewForProfile("Roll Number", rollNumber),
      //  // Divider(color: Colors.blueGrey,),
      //   customListViewForProfile(
      //     "Institute",
      //     institute,
      //   ),
      //  // Divider(color: Colors.blueGrey,height: 0,),
      //   customListViewForProfile(
      //     "Stream",
      //     stream,
      //   ),
      //  // Divider(color: Colors.blueGrey,),
      //   Container(
      //     height: 80,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: <Widget>[
      //         Expanded(
      //           flex: 1,
      //           child: customListViewForProfile(
      //             "Branch",
      //             branch,
      //           ),

      //         ),
      //         //Divider(color: Colors.blueGrey,height: 2,),
      //         Expanded(
      //             flex: 1, child: customListViewForProfile("Year", year)),
      //         Expanded(
      //             flex: 1,
      //             child: customListViewForProfile("Section", section))
      //       ],
      //     ),
      //     )
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditProfileScreen()));
        },
        child: Icon(
          LineAwesomeIcons.pen,
          color: Color(0xffdde7ee),
        ),
        backgroundColor: Color(0xff2b2f77),
      ),
    );
  }

  Widget customListViewForProfile(
      String heading, String valuevalue, IconData iconData) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      // color: Colors.blueGrey,
      // color: Colors.grey,

      // margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      height: 65,
      // width: double.infinity,
      // decoration: BoxDecoration(
      // color: Color(0xffdde7ee),
      // borderRadius: BorderRadius.circular(2)),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconData,
            size: 28,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$heading",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        //Color(0xff2b2f77),
                        fontSize: 13),
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey,),),),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 35,
                    //  width: double.infinity,

                    child: Text(valuevalue,
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 18, color: Color(0xff2b2f77)),
                        )),
                  )
                ]),
          ),
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
            // actions: <Widget>[
            //   new IconButton(
            //       splashColor: Colors.green,
            //       icon: new Icon(
            //         Icons.done,
            //         color: Colors.blue,
            //       ),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       })
            // ],
          );
        });
  }
}
