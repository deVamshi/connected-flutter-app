import 'package:flutter/material.dart';
import 'package:Connected/Screens/main_screen.dart';

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
  runApp(MyApp());    
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotePedia',
      theme: ThemeData(
       // primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
