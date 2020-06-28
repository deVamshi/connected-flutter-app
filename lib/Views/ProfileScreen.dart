import 'package:Connected/Views/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
  String avatarPath = "assets/images/1.jpg";

  String collegeSelected;
  String branchSelected;
  String sectionSelected;
  bool isButtonVisible = false;
  ScrollController controller = ScrollController();
  TextEditingController _textEditingController = TextEditingController();
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
    var profileInfo = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110,
            width: 110,
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('$avatarPath'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      // heightFactor: 100,
                      // widthFactor: 15,
                      child: IconButton(
                        onPressed: () {
                          _neverSatisfied();
                        },
                        icon: Icon(LineAwesomeIcons.pen),
                        color: Colors.black,
                        iconSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$username',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600), //kTitleTextStyle,
          ),
          SizedBox(height: 5),
          Text(
            '$rollNumber',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600), //kCaptionTextStyle,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        profileInfo,
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        controller: controller,
        children: <Widget>[
          //TextFormField(),
          // TextShowWidget("$username", Icons.face, "username"),
          // TextShowWidget("$rollNumber", LineAwesomeIcons.identification_card,
          //     "rollNumber"),
          // TextShowWidget("$institute", LineAwesomeIcons.school, "institute"),
          // TextShowWidget("$stream", LineAwesomeIcons.stream,
          //     "rollNumber"),
          // TextShowWidget("$branch", LineAwesomeIcons.code_branch,
          //     "rollNumber"),
          // TextShowWidget("$year", LineAwesomeIcons.vector_square,
          //     "rollNumber"),
          // TextShowWidget("$section", LineAwesomeIcons.sketch,
          //     "rollNumber"),
          SizedBox(
            height: 20,
          ),
          header,

          // customListViewForProfile(
          //   "Name",
          //   username,
          // ),
          // customListViewForProfile(
          //   "Roll Number",
          //   rollNumber,
          // ),
          customListViewForProfile(
            "Institute",
            institute,
          ),
          customListViewForProfile(
            "Stream",
            stream,
          ),
          // customListViewForProfile(
          //   "Branch",
          //   branch,
          // ),
          // customListViewForProfile("Year", year),
          // customListViewForProfile("Section", section)
          // ,
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: customListViewForProfile(
                    "Branch",
                    branch,
                  ),
                ),
                Expanded(
                    flex: 1, child: customListViewForProfile("Year", year)),
                Expanded(
                    flex: 1,
                    child: customListViewForProfile("Section", section))
              ],
            ),
          )

          // Container(
          //     height: 35,
          //     margin: EdgeInsets.symmetric(horizontal: 60),
          //     child: isButtonVisible
          //         ? RaisedButton(
          //             child: Text(
          //               "Save",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //             onPressed: () {
          //               print("presed");
          //               Scaffold.of(context).showSnackBar(SnackBar(
          //                 content: Text('Changes saved succesfully!'),
          //                 action: SnackBarAction(
          //                   label: 'Ok',
          //                   onPressed: () {
          //                     // Some code to undo the change.
          //                   },
          //                 ),
          //               ));
          //               setState(() {
          //                 isButtonVisible = false;
          //               });
          //             },
          //             color: Colors.blueGrey,
          //           )
          //         : SizedBox()),
          // SizedBox(
          //   height: 20,
          // ), // Container(color: Colors.red,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditProfileScreen()));
        },
        child: Icon(LineAwesomeIcons.pen),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  // Widget TextShowWidget(String text, IconData icon, String valueToBeChanged) {
  //   return Container(
  //       //color: Colors.blueGrey,
  //       // width: MediaQuery.of(context).size.width,
  //       //decoration: BoxDecoration(border: Border.all()),
  //       height: 50, //kSpacingUnit.w * 5.5,
  //       padding: EdgeInsets.symmetric(horizontal: 21 //kSpacingUnit.w * 2,
  //           ),
  //       child: Row(children: <Widget>[
  //         Icon(icon, size: 27 // kSpacingUnit.w * 2.5,
  //             ),
  //         SizedBox(width: 16), //kSpacingUnit.w * 1.5),
  //         Text(text,
  //             style: TextStyle(
  //                 fontSize: 19,
  //                 fontWeight: FontWeight.w600) // kTitleTextStyle.copyWith(
  //             ),
  //         Spacer(),
  //         IconButton(
  //           icon: Icon(LineAwesomeIcons.pen),
  //           iconSize: 20,
  //           onPressed: () {
  //             _displayDialog(valueToBeChanged);
  //           },
  //         )
  //       ]));
  // }

  Widget customListViewForProfile(
    String heading,
    String valuevalue,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      // color: Colors.blueGrey,

      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      height: 75,
      // width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$heading",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 13),
            ),
            Container(
              // decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey,),),),
              padding: EdgeInsets.symmetric(vertical: 5),
              height: 35,
              //  width: double.infinity,

              child: Text(valuevalue,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  )
                  // DropdownButtonFormField(
                  //     isExpanded: true,
                  //     items: _currencies.map((String value) {
                  //       return DropdownMenuItem(value: value, child: Text(value));
                  //     }).toList(),
                  //     onChanged: (newValue) {
                  //       // do other stuff with _category
                  //       setState(() {
                  //         collegeSelected = newValue;
                  //         valuevalue = newValue;
                  //         isButtonVisible = true;
                  //         controller.jumpTo(controller.position.maxScrollExtent);
                  //       });
                  //     },
                  //     value: valuevalue,
                  //     decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //       filled: true,
                  //       fillColor: Colors.grey[200],
                  //       hintText: "Select your college",
                  //       //errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                  //     )),
                  ),
            )
          ]),
    );
  }

//   _displayDialog(String valueToChange) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             //title: Text("Edit"),
//             content: TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration(hintText: "Ex: Sneha"),
//             ),
//             actions: <Widget>[
//               new FlatButton(
//                 child: new Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               new FlatButton(
//                 child: new Text('Save'),
//                 onPressed: () {
//                   print(valueToChange);
//                   Navigator.of(context).pop();
//                   setState(() {
//                     if (valueToChange == "username") {
//                       username = _textEditingController.text;
//                     } else {
//                       rollNumber = _textEditingController.text;
//                     }
//                   });
//                 },
//               )
//             ],
//           );
//         });
//   }
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
              height: 180,
              //width: MediaQuery.of(context).size.width ,
              child: new GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  // padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 4.0,
                  children: <String>[
                    // 'assets/images/1.jpg',
                    // 'assets/images/2.jpg',
                    // 'assets/images/3.jpg',
                    // 'assets/images/4.jpg',
                    // 'assets/images/5.jpg',
                    //'assets/images/6.jpg',
                    //'assets/images/7.jpg',
                   // 'assets/images/8.jpg',
                    // 'assets/images/9.jpg',
                    // 'assets/images/11.jpg',
                    // 'assets/images/12.jpg',
                    // 'assets/images/13.jpg',
                    // 'assets/images/14.jpg',
                    // 'assets/images/15.jpg',
                    // 'assets/images/16.jpg',
                    // 'assets/images/17.jpg',
                    'assets/images/21.jpg',
                    'assets/images/22.jpg',
                    'assets/images/23.jpg',
                    'assets/images/29.jpg',
                    'assets/images/24.jpg',
                    'assets/images/25.jpg',
                    'assets/images/26.jpg',
                    'assets/images/27.jpg',
                    'assets/images/28.jpg',
                    // 'assets/images/18.jpg',
                    // 'assets/images/31.jpg',
                    // 'assets/images/32.jpg',
                    // 'assets/images/33.jpg',
                    // 'assets/images/34.jpg',
                    // 'assets/images/35.jpg',
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
