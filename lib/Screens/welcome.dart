import 'package:Connected/Screens/JoinScreen.dart';
import 'package:Connected/Screens/main_screen.dart';
import 'package:Connected/userPrefs.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Box<bool> userPrefsBox;
  bool isAuth;

  @override
  void initState() {
    super.initState();
  }

  //https://github.com/vineeshvk/chat-app-flutter/blob/master/lib/src/state/app_state.dart

  // getLogInStateHiveBox() async {
  //   userPrefsBox = Hive.box<bool>("USERPREFS");
  //   bool result = userPrefsBox.get("isAuth");
  //   if (result == true) {
  //     UserPrefs.isAuth = true;
  //   }
  // }

  // @override
  // void initState() {
  //   //     googleSignIn.onCurrentUserChanged.listen((account) {
  //   //   handleSignIn(account);
  //   //   print("google sign in on current user change listerner");
  //   // }, onError: (err) {
  //   //   print("error occured shit $err");
  //   // });
  //   // googleSignIn.signInSilently(suppressErrors: false).then((account) {
  //   //   handleSignIn(account);
  //   //   print("google sign in silently user change listerner");
  //   // }).catchError((err) {
  //   //   print("error occured: ${err.message}");
  //   // });
  //   super.initState();
  //   // googleSignIn.onCurrentUserChanged.listen((account) {
  //   //   handleSignIn(account);
  //   //   print("google sign in on current user change listerner");
  //   // }, onError: (err) {
  //   //   print("error occured shit $err");
  //   // });
  //   // googleSignIn.signInSilently(suppressErrors: false).then((account) {
  //   //   handleSignIn(account);
  //   //   print("google sign in silently user change listerner");
  //   // }).catchError((err) {
  //   //   print("error occured: ${err.message}");
  //   // });
  // }

  // handleSignIn(GoogleSignInAccount account) {
  //   if (account != null) {
  //     print("user signed in: $account.");
  //     setState(() {
  //       this._isAuth = true;
  //     });
  //     print(account.displayName);
  //     // print("the value of auth is ${Contants.isAuth}");
  //   } else {
  //     setState(() {
  //       this._isAuth = false;
  //     });
  //     // print("the value of auth is ${Contants.isAuth}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return UserPrefs.isAuth ? MainScreen() : JoinScreen();
  }
}
