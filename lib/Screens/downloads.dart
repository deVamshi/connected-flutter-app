import 'package:Connected/Screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Downloads extends StatelessWidget {
  bool noDownloads = true;
  @override
  Widget build(BuildContext context) {
    return noDownloads ? buildEmptyScreen(LineAwesomeIcons.download, "No downloads found") : Container();
  }
}