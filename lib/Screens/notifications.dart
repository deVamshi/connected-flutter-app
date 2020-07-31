import 'package:Connected/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'widgets.dart';
import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool noNotifs = true;

  List<String> notifications = [
    "Tejesh and 56 others found your pdf file useful.",
    "Tejesh found your pdf usefull.",
    "Tejesh found your pdf usefull.",
    "Tejesh found your pdf usefull.",
    "Tejesh found your pdf usefull",
    "Tejesh found your pdf usefull",
    "Tejesh found your pdf usefull",
    "Tejesh found your pdf usefull",
  ];

  buildnotificationPage() {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.black),
          child: ListView.separated(
              itemBuilder: (_, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage("assets/images/18.jpg"),
                  ),
                  title: RichText(
                    text: TextSpan(
                        text: "Tejesh",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: "56 others",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: " liked your pdf.",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ]),
                  )

                  // Text(
                  //   "${notifications[index]}",
                  //   // style: GoogleFonts.lato(),
                  //   overflow: TextOverflow.clip,
                  // ),
                  ),
              separatorBuilder: (_, index) => Divider(),
              itemCount: notifications.length),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return notifications.length == 0
        ? buildEmptyScreen(Icons.notifications_active, "Nothing's here yet!")
        : buildnotificationPage();
  }
}
