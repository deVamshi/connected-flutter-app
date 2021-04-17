import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalPercentDialog extends StatefulWidget {
  final double goalPercent;

  const GoalPercentDialog({Key key, this.goalPercent}) : super(key: key);
  @override
  _GoalPercentDialogState createState() => _GoalPercentDialogState();
}

class _GoalPercentDialogState extends State<GoalPercentDialog> {
  double currentGoalPercent;
  @override
  void initState() {
    super.initState();
    currentGoalPercent = widget.goalPercent;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Goal Percentage:',
        style: GoogleFonts.lato(),
      ),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${currentGoalPercent.round()}%",
              style: GoogleFonts.lato(
                  fontSize: 40,
                  color: currentGoalPercent.round() < 75
                      ? Colors.red
                      : Colors.green),
            ),
            Slider(
              value: currentGoalPercent,
              activeColor:
                  currentGoalPercent.round() < 75 ? Colors.red : Colors.green,
              min: 40,
              max: 99,
              // divisions: 50,
              // label: currentGoalPercent.round().toString(),
              onChanged: (value) {
                setState(() {
                  currentGoalPercent = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            // Use the second argument of Navigator.pop(...) to pass
            // back a result to the page that opened the dialog
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: GoogleFonts.lato(color: Colors.grey),
          ),
        ),
        FlatButton(
          onPressed: () {
            // Use the second argument of Navigator.pop(...) to pass
            // back a result to the page that opened the dialog
            Navigator.pop(context, currentGoalPercent);
          },
          child: Text(
            'Done',
            style: GoogleFonts.lato(color: Colors.black),
          ),
        )
      ],
    );
  }
}
