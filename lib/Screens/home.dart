import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'list_of_pdf_screen.dart';
import 'widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> favoriteSubjects = [
    // "Python",
    // "Chemistry",
    // "AutoCAD",
    // "Mechanics",
    // "Lab work",
    // "Lab work",
    // "Python",
    // "Chemistry",
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
      child: CustomScrollView(
        //  controller: staticFields.barController1,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColor.mainColor,
            elevation: 0,
            leading: Container(),
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/vectorr.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          favoriteSubjects.length != 0
              ? SliverToBoxAdapter(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      color: AppColor.bgColor,
                      height: 50.0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Favorites",
                            style: GoogleFonts.lato(fontSize: 30),
                          ),
                        ],
                      )),
                )
              : SliverToBoxAdapter(),
          favoriteSubjects.length != 0
              ? SliverToBoxAdapter(
                  child: Container(
                    // padding: EdgeInsets.only(left: 15),
                    color: AppColor.bgColor,
                    height: 75.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: favoriteSubjects.length,
                      itemBuilder: (context, index) {
                        return _favoriteContainer(index);
                      },
                    ),
                  ),
                )
              : SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              color: AppColor.bgColor,
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.star_border,
                    // color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "All",
                    style: GoogleFonts.lato(
                      fontSize: 30,
                    ),
                  ),
                ],
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
  }

  Widget _favoriteContainer(int index) {
    return Container(
      color: AppColor.bgColor,
      margin: EdgeInsets.only(left: 5, right: 5),
      width: 180.0,
      child: Card(
        color: AppColor.tileColor,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            favoriteSubjects[index],
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )),
      ),
    );
  }

  Widget _subjectContainer(
    BuildContext context,
    String subjectName, // Color color
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Card(
        margin: EdgeInsets.all(2),
        color: AppColor.tileColor,
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
                  backgroundImage:
                      AssetImage("assets/images/circle-cropped.png"),
                  radius: 25,
                ),
              ),
              Expanded(
                child: Text(
                  subjectName,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
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
                        color: Colors.red,
                      )
                    : Icon(Icons.star_border),
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
