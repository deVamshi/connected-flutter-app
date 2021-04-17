// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// //import 'package:dropdown_formfield/dropdown_formfield.dart';

// class EditProfileScreen extends StatefulWidget {
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   String username = "Vamshidhar Telugu";
//   String rollNumber = "19121A04M2";

//   String collegeSelected;
//   String branchSelected;
//   String sectionSelected;
//   //bool isButtonVisible = false;
//   ScrollController controller = ScrollController();
//   // TextEditingController _nameTextEditingController = TextEditingController();
//   // TextEditingController _rollNumberTextEditingController =
//   //     TextEditingController();
//   //String _currentSelectedValue = "";
//   var _currencies = [
//     "Food",
//     "Transport",
//     "Personal",
//     "Shopping",
//     "Medical",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff2b2f77),
        
//         title: Text("Edit Details"),
//         actions: <Widget>[
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: FlatButton(
//               onPressed: () {
//                 print("save functionality");
//                 Navigator.pop(context);
//               },

//               //color: Color(0xffdde7ee),
//               child: Center(
//                 child: Text(
//                   "Save",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(new FocusNode());
//         },
//         child: ListView(
//           controller: controller,
//           children: <Widget>[
//             SizedBox(
//               height: 25,
//             ),
//             customListViewForProfile(
//               "Institute",
//               collegeSelected,
//             ),
//             customListViewForProfile(
//               "Stream",
//               branchSelected,
//             ),
//             customListViewForProfile(
//               "Branch",
//               branchSelected,
//             ),
//             customListViewForProfile(
//               "Year",
//               branchSelected,
//             ),
//             customListViewForProfile(
//               "Section",
//               sectionSelected,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget customListViewForProfile(
//     String heading,
//     String valuevalue,
//   ) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
//       height: 90,
//       // width: double.infinity,
//       //decoration: BoxDecoration(border: Border.()),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//               // color: Colors.grey[600],
//               height: 15,
//               child: Text(
//                 "$heading",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey,
//                     fontSize: 13),
//               )),
//           DropdownButtonFormField(
//               isExpanded: true,
//               items: _currencies.map((String value) {
//                 return DropdownMenuItem(value: value, child: Text(value));
//               }).toList(),
//               onChanged: (newValue) {
//                 // do other stuff with _category
//                 setState(() {
//                   collegeSelected = newValue;
//                   valuevalue = newValue;
//                   //isButtonVisible = true;
//                   //controller.jumpTo(controller.position.maxScrollExtent);
//                 });
//               },
//               value: valuevalue,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 hintText: "Select your college",
//                 //errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
//               )),
//         ],
//       ),
//     );
//   }
// }
