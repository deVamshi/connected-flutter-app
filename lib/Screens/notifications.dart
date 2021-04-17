import 'package:Connected/colors.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
    return ListView.separated(
            itemBuilder: (_, index) => ListTile(
                  trailing: Icon(
                    LineAwesomeIcons.thumbs_up,
                    color: NewColors.appHeaderColor,
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage("assets/images/11.jpg"),
                  ),
                  title: RichText(
                    text: TextSpan(
                        text: "Tejesh",
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            color: NewColors.appHeaderColor,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: " liked your pdf upload.",
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: NewColors.appHeaderColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                ),
            separatorBuilder: (_, index) => Divider(),
            itemCount: notifications.length);
    // );
  }

  @override
  Widget build(BuildContext context) {
    return notifications.length == 0
        ? buildEmptyScreen(Icons.notifications_active, "Nothing's here yet!")
        : buildnotificationPage();
  }
}
