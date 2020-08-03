import 'package:Connected/Screens/welcome.dart';
import 'package:Connected/userPrefs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getLogInState() async {
  //shared prefs intance required to instantiate
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //getting the values
  var isAuthResult = prefs.getBool("isAuth");
  var isDarkResult = prefs.getBool("isDark");
  print("isAuthResult: $isAuthResult");
  print("isDarkResult: $isDarkResult");
  //if they are true then make them true or else let them be false
  if (isAuthResult == true) {
    UserPrefs.isAuth = true;
  }
  if (isDarkResult == true) {
    UserPrefs.isDark = true;
  }
}

// getLogInStateHiveBox() async {
//   HiveBoxes.userPrefsHiveBox = Hive.box<bool>("USERPREFS");
//   bool result = HiveBoxes.userPrefsHiveBox.get("isAuth");
//   bool isDark = HiveBoxes.userPrefsHiveBox.get("isDark");

//   print("hive result get log in state $result");
//   if (result == true) {
//     UserPrefs.isAuth = true;
//   }
//   print("hive result isDark value in $isDark");
//   if (isDark == true) {
//     UserPrefs.isDark = true;
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Directory dir = await getApplicationDocumentsDirectory();
  // Hive.init(dir.path);
  // await Hive.openBox<bool>("USERPREFS");
  // await getLogInStateHiveBox();
  await getLogInState();

  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotePedia',
      theme: ThemeData(
        // canvasColor: Colors.grey[800],
        accentColor: Colors.black,
      ),
      home: Welcome(),
      // MainScreen(),
    );
  }
}
