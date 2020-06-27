import 'package:Connected/Views/DetailClassRooms.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'dart:math';

class ClassRooms extends StatelessWidget {
  final Random _random = Random();

  final List<Color> _listOfColors = [
    Colors.blue[300],
    Colors.cyan[300],
    Colors.greenAccent,
    Colors.pink[200],
    Colors.orange[200],
    Colors.purple[200],
    Colors.red[200],
    Colors.teal[200],
    Colors.amber[200],
    Colors.green[200],
    Colors.brown[200],
    Colors.blue[300],
    Colors.cyan[300],
    Colors.greenAccent,
    Colors.pink[200],
    Colors.orange[200],
    Colors.purple[200],
    Colors.red[200],
    Colors.teal[200],
    Colors.amber[200],
    Colors.green[200],
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
    return Scaffold(
      // appBar: AppBar(title: Text("Connect"),),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: Text("Connect"),
            pinned: false,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/wallpaperforapp.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _subjectContainer(
                  context,
                  _listOfStrings[index],
                  _listOfColors[index < _listOfColors.length
                      ? index
                      : _random.nextInt(_listOfColors.length)]);
            }, childCount: _listOfStrings.length),
          ),
          // SliverList(
          //   delegate:
          //       SliverChildBuilderDelegate((BuildContext context, int index) {
          //     return _subjectContainer(
          //         context,
          //         _listOfStrings[index],
          //         _listOfColors[index < _listOfColors.length
          //             ? index
          //             : _random.nextInt(_listOfColors.length)]);
          //   }, childCount: _listOfStrings.length),
          // )
        ],
      ),
    );
  }
  Widget _subjectContainer(
      BuildContext context, String subjectName, Color color) {
    return Card(
      margin: EdgeInsets.all(3),
      color: color,
      child: InkWell(
        onTap: (){
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailClassRooms()));
        },
              child: Center(
          child: Text(
            subjectName,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}