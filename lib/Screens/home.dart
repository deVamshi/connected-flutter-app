import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_of_pdf_screen.dart';
import 'widgets.dart';

class Home extends StatelessWidget {
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
      child: CustomScrollView(
        //  controller: staticFields.barController1,
        slivers: <Widget>[
          SliverAppBar(
            // iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff2b2f77),
            // Color(
            // (0xff2b2f77),
            //),
            // title: Text(
            //   "Notepedia",
            //   style: GoogleFonts.lato(color: Colors.black),
            // ),
            elevation: 0,
            // actions: <Widget>[],
            leading: Container(),

            expandedHeight: 220.0,
            //pinned: true,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/vectorr.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _subjectContainer(
                context,
                _listOfStrings[index],
              );
            }, childCount: _listOfStrings.length),
          )
        ],
      ),
    );
    //  );
  }

  Widget _subjectContainer(
    BuildContext context,
    String subjectName, // Color color
  ) {
    return Card(
      // elevation: 0,
      margin: EdgeInsets.all(2),
      color: Color(0xffdde7ee),

      child: InkWell(
        splashColor: Colors.white,
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ListOfPdf()));
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/science.png"),
                radius: 25,
              ),
            ),
            Text(
              subjectName,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
