import 'widgets.dart';
import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  bool noNotifs = true;

  

  @override
  Widget build(BuildContext context) {
    return noNotifs ? buildEmptyScreen(Icons.notifications_active,"Nothing's here yet!") : Container();
  }
}
