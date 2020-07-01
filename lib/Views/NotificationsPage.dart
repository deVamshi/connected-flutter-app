import 'package:Connected/Views/DetailNotificationPage.dart';
import 'package:Connected/Views/HomePage.dart';
import 'package:Connected/Views/staticFields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Notifications extends StatelessWidget {
  String sampleText =
      "There are three reasons why I prefer jogging to other sports. One reason is that jogging is a cheap sport. I can practise it anywhere at any time with no need for a ball or any other equipment. Another reason why I prefer jogging is that it is friendly to my heart. I don’t have to exhaust myself or do excessive efforts while jogging. Finally, I prefer this sport because it is safe. It isn’t as risky as other sports like gymnastics, racing or horseback riding. For all these reasons, I consider jogging the best sport of all.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2f77),
          body: CustomScrollView(
          controller: staticFields.barController2,
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            title: Text("Notifications"),
          ),
           SliverList(
             
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return _NotificationTile(context, sampleText);
              }, childCount: 6),
            )
        ],
      ),
    );

    
    // ListView.builder(
    //     itemCount: 6,
    //     itemBuilder: (context, index) {
    //       return _NotificationTile(context, sampleText);
    //     });
  }
}

Widget _NotificationTile(BuildContext context, String matter) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    // decoration: BoxDecoration(
    //     color: Colors.transparent,
    //     border: Border(bottom: BorderSide(color: Colors.grey))),
    // // margin: EdgeInsets.only(left: 5, right: 5, top: 5),
    height: 200,
    //width: MediaQuery.of(context).size.width,
    child: InkWell(
      onTap: (){

         Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailNotificationPage()));

      },
      splashColor: Colors.red,
          child: Card(
            //color: Color(0x80dde7ee),
        //elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/13.jpg"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text("Niva Office",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                  Expanded(
                    child: Text(
                      "18/03/2020 at 5:30 PM",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("To: Students of first year 2019 regulation",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(
                height: 5,
              ),
              Text("About: Corona Holidays ",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(
                height: 5,
              ),
              Text("Content:",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(
                height: 5,
              ),
              Text(matter,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style:
                      GoogleFonts.lato(textStyle: TextStyle(fontSize: 13))),
              // SizedBox(
              //   height: 6,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     IconButton(
              //       iconSize: 20,

              //       onPressed: () {
              //         print("pressed");
              //       },
              //       icon: Icon(Icons.comment),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //       IconButton(
              //         iconSize: 20,

              //       onPressed: () {
              //         print("pressed");
              //       },
              //       icon: Icon(Icons.share),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    ),
  );
}
