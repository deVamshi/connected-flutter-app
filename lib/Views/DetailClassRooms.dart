// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class DetailClassRooms extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           //elevation: 0.0,
//           title: Text("Network Analysis"),
//           // bottom: TabBar(
//           //   tabs: <Widget>[
//           //     Tab(
//           //       text: "Discussion",
//           //     ),
//           //     Tab(
//           //       text: "Course Files",
//           //     )
//           //   ],
//           // ),
//         ),
//         body:  courseFilesListView(),
        
//         // TabBarView(
//         //   children: <Widget>[
//         //     Container(
//         //       child: Center(
//         //         child: Text("Discussions"),
//         //       ),
//         //     ),
//         //     courseFilesListView(),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }

// Widget courseFilesListView() {
//   //List<int> trialList = [1,2,3,6,5,4,7,8,9];
//   return ListView.separated(
    
//     itemCount: 20,
//     itemBuilder: (context, index) {
//       return ListTile(
//         //dense: true,
//       //  contentPadding: EdgeInsets.symmetric(horizontal: 10),
//         onTap: (){print("tapped");},
//         //leading: Text("${index + 1}."),
//         title: Text("${index + 1}.  A sample course file ",overflow: TextOverflow.ellipsis,style: GoogleFonts.lato(),)
//         // trailing: IconButton(
//         //   icon: Icon(LineAwesomeIcons.download),
//         //   onPressed: (){
//         //     print("Need to implement the download method");
//         //   },
//         // ),
//       );
//     },
//     separatorBuilder: (context, index) {
//       return Container(height: 1,color: Colors.grey[300],);
//     },
//   );
// }
