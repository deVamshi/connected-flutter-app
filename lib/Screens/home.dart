import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_of_pdf_screen.dart';
import 'widgets.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> favoriteSubjects = [];

  static List<dynamic> listOfColors = [
    Colors.blue[300],
    Colors.cyan[300],
    Colors.greenAccent,
    Colors.pink[100],
    Colors.orange[200],
    Colors.purple[200],
    Colors.amber[200],
    Colors.red[200],
    Colors.teal[200],
    Colors.yellow[100],
    Colors.brown[200]
  ];

  List<String> _listOfStrings = [
    "Network Analysis",
    "Python",
    "Chemistry",
    "AutoCAD",
    "Mechanics",
    "Lab work",
    "Python",
    "Chemistry",
    "AutoCAD",
    "Mechanics",
    "Lab work",
    "Lab work",
    "Python",
    "Chemistry",
    "AutoCAD",
    "Mechanics",
    "Lab work",
    "Lab work",
    "Python",
    "Chemistry",
    "AutoCAD",
    "Mechanics",
    "Lab work",
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Welcome to",
              style: GoogleFonts.lato(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Notepedia",
              style: GoogleFonts.lato(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // color: AppColor.bgColor,
            color: Colors.transparent,

            child: Row(
              children: <Widget>[
                Icon(
                  LineAwesomeIcons.pdf_file,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "TextBooks & Pdfs",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.2),
            itemBuilder: (_, index) => homePageContainer(index),
            itemCount: 8,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // color: AppColor.bgColor,
            color: Colors.transparent,

            child: Row(
              children: <Widget>[
                Icon(LineAwesomeIcons.stream),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Miscellaneous",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.2),
            itemBuilder: (_, index) => homePageContainerList(index),
            itemCount: 3,
          ),
        ],
      ),
    );
    // Scaffold(
    // drawer: Container(),
    // appBar: buildAppBar("Notepedia"),
    // backgroundColor: Colors.black,
    // body:
    //     ScrollConfiguration(
    //   behavior: MyBehavior(),
    //   child: CustomScrollView(
    //     //  controller: staticFields.barController1,
    //     slivers: <Widget>[
    //       // SliverAppBar(
    //       //   backgroundColor: Colors.transparent,
    //       //   elevation: 0,
    //       //   leading: Container(),
    //       //   expandedHeight: 220.0,
    //       //   flexibleSpace: FlexibleSpaceBar(
    //       //     background: Image.asset(
    //       //       'assets/images/vectorr.jpg',
    //       //       fit: BoxFit.fill,
    //       //     ),
    //       //   ),
    //       // ),
    //       favoriteSubjects.length != 0
    //           ? SliverToBoxAdapter(
    //               child: Container(
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    //                   // color: AppColor.bgColor,
    //                   color: Colors.transparent,
    //                   height: 50.0,
    //                   child: Row(
    //                     children: <Widget>[
    //                       Icon(
    //                         Icons.star,
    //                         color: NewColors.selectedStarColor,
    //                         size: 20,
    //                       ),
    //                       SizedBox(
    //                         width: 10,
    //                       ),
    //                       Text(
    //                         "Favorites",
    //                         style: GoogleFonts.lato(
    //                             color: NewColors.appHeaderColor,
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                     ],
    //                   )),
    //             )
    //           : SliverToBoxAdapter(),
    //       favoriteSubjects.length != 0
    //           ? SliverToBoxAdapter(
    //               child: Container(
    //                 //  padding: EdgeInsets.only(left: 15),
    //                 color: Colors.transparent,
    //                 height: 110.0,
    //                 child: ListView.builder(
    //                   scrollDirection: Axis.horizontal,
    //                   itemCount: favoriteSubjects.length,
    //                   itemBuilder: (context, index) {
    //                     return _favoriteContainer(index);
    //                   },
    //                 ),
    //               ),
    //             )
    //           : SliverToBoxAdapter(),
    //       SliverToBoxAdapter(
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 20,
    //           ),
    //           color: Colors.transparent,
    //           // color: Colors.grey[200],
    //           height: 40.0,
    //           child: Row(
    //             children: <Widget>[
    //               Icon(
    //                 Icons.star_border,
    //                 size: 20,
    //                 color: NewColors.appHeaderColor,
    //               ),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Text(
    //                 "All",
    //                 style: GoogleFonts.lato(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   color: NewColors.appHeaderColor,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       SliverList(
    //         delegate:
    //             SliverChildBuilderDelegate((BuildContext context, int index) {
    //           return _subjectContainer(
    //             context,
    //             _listOfStrings[index],
    //           );
    //         }, childCount: _listOfStrings.length),
    //       )
    //     ],
    //   ),
    // );
  }

  Widget homePageContainerList(int index) {
    return Container(
      height: 50,
      child: Card(
        // color: listOfColors[index],

        // color: Colors.blue[100],
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              // _listOfStrings[index],
              "Syllabus",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,

                  //  NewColors.homePageTileTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget homePageContainer(int index) {
    return Card(
      color: listOfColors[index],
      // color: Colors.blue[100],
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListOfPdf(),
            ),
          );
        },
        splashColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              _listOfStrings[index],
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,

                  //  NewColors.homePageTileTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _favoriteContainer(int index) {
    return Container(
      width: 125,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: Color(0xffdde7ee),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage("assets/images/circle-cropped.png"),
                radius: 25,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                favoriteSubjects[index],
                // "Network Analysis is an easy subject",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: NewColors.homePageTileTextColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _subjectContainer(
    BuildContext context,
    String subjectName, // Color color
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Card(
        // elevation: 5,
        // shadowColor: Colors.black,
        color: Color(0xffdde7ee),
        //  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        // decoration: BoxDecoration(

        //   // border: Border(
        //   //   left: BorderSide(color: Colors.black, width: 5),
        //   //   top: BorderSide(
        //   //     color: Colors.grey[900],
        //   //   ),
        //   //   bottom: BorderSide(
        //   //     color: Colors.grey[900],
        //   //   ),
        //   //   right: BorderSide(color: Colors.grey[900]),
        //   // ),

        // ),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        // color: NewColors.homePageTileColor,
        // color: NewColors.homePageTileColor,
        // color: Colors.grey[50],
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListOfPdf(),
              ),
            );
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      AssetImage("assets/images/circle-cropped.png"),
                ),
              ),
              Expanded(
                child: Text(
                  subjectName,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(

                        //  NewColors.homePageTileTextColor,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Spacer(),
              IconButton(
                icon: favoriteSubjects.contains(subjectName)
                    ? Icon(
                        Icons.star,
                        color: NewColors.selectedStarColor,
                        size: 20,
                      )
                    : Icon(
                        Icons.star_border,

                        //  NewColors.appHeaderColor,
                        size: 20,
                      ),
                onPressed: () {
                  if (favoriteSubjects.contains(subjectName)) {
                    setState(() {
                      favoriteSubjects.remove(subjectName);
                    });
                  } else {
                    setState(() {
                      favoriteSubjects.add(subjectName);
                    });
                  }
                },
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
