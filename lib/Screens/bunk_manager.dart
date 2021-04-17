import 'package:Connected/Screens/goal_percent.dart';
import 'package:Connected/Screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Connected/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BunkManager extends StatefulWidget {
  @override
  _BunkManagerState createState() => _BunkManagerState();
}

class _BunkManagerState extends State<BunkManager> {
  double goalPercent = 56;
  buildListTile(String title, int value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // FlatButton(
          //   onPressed: () {},
          //   color: Colors.grey[200],
          //   child: Icon(Icons.remove),
          // ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey[100],
            ),
            child: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {},
              splashColor: Colors.red[200],
            ),
          ),
          // FlatButton(
          //   shape: CircleBorder(side: BorderSide()),
          //   splashColor: Colors.red[200],
          //   onPressed: () {},
          //   color: Colors.grey[200],
          //   child: Icon(Icons.remove),
          // ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.lato(
                    fontSize: 15, fontWeight: FontWeight.bold, color: color),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "$value",
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey[100],
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
              splashColor: Colors.green[200],
            ),
          ),
          SizedBox(
            width: 10,
          ),

          // FlatButton(
          //   shape: CircleBorder(side: BorderSide()),
          //   splashColor: Colors.green[200],
          //   onPressed: () {},
          //   color: Colors.grey[200],
          //   child: Icon(Icons.add),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView(
        shrinkWrap: true,
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Center(
            child: Text(
              "10",
              style: GoogleFonts.lato(
                fontSize: 80,
                // color: Colors.green,
              ),
            ),
          ),
          Center(
            child: Text(
              "Bunks Available",
              style: GoogleFonts.lato(fontSize: 20),
            ),
          ),
          Divider(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // color: AppColor.bgColor,

            child: Row(
              children: <Widget>[
                Icon(LineAwesomeIcons.pie_chart),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Summary",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 10,
              ),
              smallContainers(Colors.green[200], "Attended", "57",
                  LineAwesomeIcons.smiling_face),
              SizedBox(
                width: 10,
              ),
              smallContainers(Colors.red[200], "Bunked", "13",
                  LineAwesomeIcons.winking_face_with_tongue),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 10,
              ),
              smallContainers(Colors.purple[200], "Your Attendance", "65%",
                  LineAwesomeIcons.percentage),
              SizedBox(
                width: 10,
              ),
              smallContainers(
                  Colors.amber[200], "Goal", "${goalPercent.round().toString()}%", LineAwesomeIcons.burn),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "*Tap on the Goal Card to edit Goal Percentage",
              style: GoogleFonts.lato(color: Colors.grey, fontSize: 10),
            ),
          ),
          Divider(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // color: AppColor.bgColor,

            child: Row(
              children: <Widget>[
                Icon(LineAwesomeIcons.pen),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Edit",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          buildListTile("Attended:", 84, Colors.green[200]),
          SizedBox(
            height: 10,
          ),

          buildListTile("Bunked:", 24, Colors.red[200]),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // color: AppColor.bgColor,

            child: Row(
              children: <Widget>[
                Icon(
                  LineAwesomeIcons.exclamation_circle,
                  // color: Colors.red[200],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Note",
                  style: GoogleFonts.lato(
                      // color: Colors.red[200],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            // color: AppColor.bgColor,

            child: Text(
              "You can bunk the next 10 classes",
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          Divider(),

          Icon(
            LineAwesomeIcons.quote_left,
            size: 60,
          ),

          // Padding(
          //   padding: const EdgeInsets.only(left: 20),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: Icon(
          //       LineAwesomeIcons.quote_left,
          //       size: 25,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Center(
              child: Text(
                "When you look back, Marks will never make you laugh but memories will.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(height: 1.3),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget smallContainers(
      Color color, String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        height: 70,
        // margin: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          color: color,
          child: InkWell(
            onTap: title == "Goal" ? () => {showGoalPercentDialog()} : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        // "Network Analysis is an easy subject",
                        style: GoogleFonts.lato(
                          // fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.grey[800],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$value",
                        // "Network Analysis is an easy subject",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: NewColors.homePageTileTextColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCustomProfileTile(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Card(
        color: NewColors.homePageTileColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              // Icon(
              //   iconData,
              //   color: NewColors.appHeaderColor,
              // ),
              Text(
                "$title",
                style: GoogleFonts.lato(
                    fontSize: 15, color: NewColors.appHeaderColor),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$value",
                style: GoogleFonts.lato(
                    fontSize: 15, color: NewColors.appHeaderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showGoalPercentDialog() async {
    // <-- note the async keyword here

    // this will contain the result from Navigator.pop(context, result)
    final selectedGoalPercent = await showDialog<double>(
      context: context,
      builder: (context) => GoalPercentDialog(goalPercent: 75),
    );

    // execution of this code continues when the dialog was closed (popped)

    // note that the result can also be null, so check it
    // (back button or pressed outside of the dialog)
    if (selectedGoalPercent != null) {
      setState(() {
        goalPercent = selectedGoalPercent;
        print(goalPercent);
      });
    }
  }
}
