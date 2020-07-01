import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String username = "Vamshidhar Telugu";
  String rollNumber = "19121A04M2";

  String collegeSelected;
  String branchSelected;
  String sectionSelected;
  //bool isButtonVisible = false;
  ScrollController controller = ScrollController();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _rollNumberTextEditingController =
      TextEditingController();
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
    // var profileInfo = Expanded(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: <Widget>[
    //       Container(
    //         height: 110,
    //         width: 110,
    //         child: Stack(
    //           children: <Widget>[
    //             CircleAvatar(
    //               radius: 60,
    //               backgroundImage: AssetImage('assets/images/sophia.jpg'),
    //             ),
    //             Align(
    //               alignment: Alignment.bottomRight,
    //               child: Container(
    //                 height: 30,
    //                 width: 25,
    //                 decoration: BoxDecoration(
    //                   color: Colors.amber,
    //                   shape: BoxShape.circle,
    //                 ),
    //                 child: Center(
    //                   heightFactor: 15,
    //                   widthFactor: 15,
    //                   child: Icon(
    //                     LineAwesomeIcons.pen,
    //                     color: Colors.black,
    //                     size: 18,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(height: 18),
    //       Text(
    //         'Nicolas Adams',
    //         style: TextStyle(
    //             fontSize: 20, fontWeight: FontWeight.w600), //kTitleTextStyle,
    //       ),
    //       SizedBox(height: 5),
    //       Text(
    //         'nicolasadams@gmail.com',
    //         style: TextStyle(
    //             fontSize: 15, fontWeight: FontWeight.w600), //kCaptionTextStyle,
    //       ),
    //       SizedBox(height: 20),
    //     ],
    //   ),
    // );
    // var header = Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     profileInfo,
    //   ],
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Details"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(15),
              width: 65,
              // height: 20,
              //height: 10,
              color: Color(0xffdde7ee),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(color: Color(0xff2b2f77)),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        controller: controller,
        children: <Widget>[
          //TextFormField(),
          // TextShowWidget("$username", Icons.face,"username"),
          // TextShowWidget("$rollNumber", LineAwesomeIcons.identification_card,"rollNumber"),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: TextField(
              onSubmitted: (newName) {
                print(newName);
                controller.jumpTo(
                  controller.position.maxScrollExtent,
                );
              },
              decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _nameTextEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Roll Number",
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _rollNumberTextEditingController,
            ),
          ),
          SizedBox(
            height: 5,
          ),

          customListViewForProfile(
            "Institute",
            collegeSelected,
          ),
          customListViewForProfile(
            "Stream",
            branchSelected,
          ),
          customListViewForProfile(
            "Branch",
            branchSelected,
          ),
          customListViewForProfile(
            "Year",
            branchSelected,
          ),
          customListViewForProfile(
            "Section",
            sectionSelected,
          ),
          SizedBox(
            height: 10,
          ),

          // Container(
          //     height: 35,
          //     margin: EdgeInsets.symmetric(horizontal: 60),
          //     child:
          //         //  isButtonVisible
          //         //     ?
          //         RaisedButton(
          //       child: Text(
          //         "Save",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       onPressed: () {
          //         print("presed");
          //         // Scaffold.of(context).showSnackBar(SnackBar(
          //         //   content: Text('Changes saved succesfully!'),
          //         //   action: SnackBarAction(
          //         //     label: 'Ok',
          //         //     onPressed: () {
          //         //       // Some code to undo the change.
          //         //     },
          //         //   ),
          //         // ));
          //         // setState(() {
          //         //   isButtonVisible = false;
          //         // });
          //       },
          //       color: Colors.blueGrey,
          //     )
          //     //: SizedBox()
          //     ),
          // SizedBox(
          //   height: 20,
          //), // Container(color: Colors.red,)
        ],
      ),
    );
  }

  // Widget TextShowWidget(String text, IconData icon,String valueToBeChanged) {
  //   return Container(
  //     //color: Colors.blueGrey,
  //    // width: MediaQuery.of(context).size.width,
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
  //             Spacer(),
  //             IconButton(icon:Icon( LineAwesomeIcons.pen),iconSize: 20,onPressed: (){_displayDialog(valueToBeChanged);},)
  //       ]));
  // }

  Widget customListViewForProfile(
    String heading,
    String valuevalue,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
      height: 90,
      // width: double.infinity,
      //decoration: BoxDecoration(border: Border.()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              // color: Colors.grey[600],
              height: 15,
              child: Text(
                "$heading",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 13),
              )),
          DropdownButtonFormField(
              isExpanded: true,
              items: _currencies.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) {
                // do other stuff with _category
                setState(() {
                  collegeSelected = newValue;
                  valuevalue = newValue;
                  //isButtonVisible = true;
                  controller.jumpTo(controller.position.maxScrollExtent);
                });
              },
              value: valuevalue,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Select your college",
                //errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
              )),
        ],
      ),
    );
  }

  // _displayDialog(String valueToChange) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           //title: Text("Edit"),
  //           content: TextField(
  //             controller: _textEditingController,
  //             decoration: InputDecoration(hintText: "Ex: Sneha"),
  //           ),
  //           actions: <Widget>[
  //             new FlatButton(
  //               child: new Text('CANCEL'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             new FlatButton(
  //               child: new Text('Save'),
  //               onPressed: () {
  //                 print(valueToChange);
  //                 Navigator.of(context).pop();
  //                 setState(() {
  //                   if(valueToChange == "username"){
  //                     username = _textEditingController.text;

  //                   } else{
  //                     rollNumber = _textEditingController.text;

  //                   }

  //                 });
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }
}
