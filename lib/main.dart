import 'package:Connected/Screens/list_of_pdf_screen.dart';
import 'package:Connected/Screens/main_screen.dart';
import 'package:Connected/Screens/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'userPrefs.dart';
// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(
//         accentColor: Colors.blue,
//         appBarTheme: AppBarTheme(
//           color: Color(0xff2b2f77),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ),
//   );
// }

void main() {
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotePedia',
      theme: ThemeData.light(),
      home: MainScreen(),
      // MainScreen(),
    );
  }
}
