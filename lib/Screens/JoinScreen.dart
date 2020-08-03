import 'package:Connected/DatabaseMethods/auth.dart';
import 'package:Connected/Screens/main_screen.dart';
import 'package:Connected/colors.dart';
import 'package:Connected/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinScreen extends StatelessWidget {
  bool _working = false;

  setLogInState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool logInState = prefs.getBool("isAuth");
    print(logInState);
    await prefs.setBool("isAuth", true);
    print("ooops");
  }

  // setLogInStateHiveBox() async {
  //   HiveBoxes.userPrefsHiveBox.put("isAuth", true);
  //   bool result = HiveBoxes.userPrefsHiveBox.get("isAuth");
  //   print("hive result set log in state $result");
  //   // HiveBoxes.userPrefsHiveBox.close();
  // }

  login(BuildContext bc) async {
    _working = true;
    bool result = await signInWithGoogle().catchError(
      (e) => print(e.toString()),
    );
    if (result == true) {
      await setLogInState();
      // await setLogInStateHiveBox();
      _working = false;
      Navigator.of(bc).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
    } else {
      _working = false;
      print(result);
      print("something went wrong");
    }
  }

  Widget _signInButton(BuildContext bc) {
    return OutlineButton(
      splashColor: Colors.grey,
      // color: Colors.blue,

      onPressed: () {
        _working ? null : login(bc);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: "appIcon",
                      child: Icon(
                        LineAwesomeIcons.atom,
                        size: 180,
                        color: Colors.black,
                      ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      "Notepedia",
                      style:
                          GoogleFonts.lato(color: Colors.black, fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            _signInButton(context),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

// class JoinScreen extends StatefulWidget {
//   @override
//   _JoinScreenState createState() => _JoinScreenState();
// }

// class _JoinScreenState extends State<JoinScreen> {
//   GoogleSignIn googleSignIn = GoogleSignIn();

//   // bool _working = false;

//   @override
//   void initState() {
//     super.initState();
//     // _loggedInState =   getLogInState()
//   }

//   // setLogInState() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   await prefs.setBool("isAuth", true);
//   // }

//   // getLogInState() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   bool logInState = prefs.getBool("isAuth");
//   //   if (logInState == true) {
//   //     UserPrefs.isAuth = true;
//   //   } else {
//   //     UserPrefs.isAuth = false;
//   //   }
//   // }

//   // getLogInState() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   bool logInState = prefs.getBool("logInState");
//   //   if (logInState == true) {
//   //     this._loggedInState = true;
//   //   } else {
//   //     this._loggedInState = false;
//   //   }
//   // }

//   // login(BuildContext bc) async {
//   //   _working = true;
//   //   bool result =
//   //       await signInWithGoogle().catchError((e) => print(e.toString()));
//   //   if (result == true) {
//   //     // setLogInState();
//   //     _working = false;
//   //     Navigator.of(bc).pushReplacement(
//   //       MaterialPageRoute(
//   //         builder: (context) {
//   //           return MainScreen();
//   //         },
//   //       ),
//   //     );
//   //   } else {
//   //     _working = false;
//   //     print("something went wrong");
//   //   }
//   //   // signInWithGoogle().whenComplete(() {
//   //   //   _working = false;
//   //   //   Navigator.of(bc).pushReplacement(
//   //   //     MaterialPageRoute(
//   //   //       builder: (context) {
//   //   //         return MainScreen();
//   //   //       },
//   //   //     ),
//   //   //   );
//   //   // }).catchError((e) => print(e));
//   // }

//   Widget _signInButton(BuildContext bc) {
//     return OutlineButton(
//       splashColor: Colors.grey,
//       // color: Colors.blue,

//       onPressed: () {
//         _working ? null : login(bc);
//       },
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//       highlightElevation: 0,
//       borderSide: BorderSide(color: Colors.black),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image(
//                 image: AssetImage("assets/images/google_logo.png"),
//                 height: 35.0),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.bgColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       LineAwesomeIcons.atom,
//                       size: 180,
//                       color: Colors.black,
//                     ),
//                     // SizedBox(
//                     //   height: 5,
//                     // ),
//                     Text(
//                       "Notepedia",
//                       style:
//                           GoogleFonts.lato(color: Colors.black, fontSize: 30),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             _signInButton(context),
//             // Card(
//             //   elevation: 5,
//             //   child: GestureDetector(
//             //     onTap: () {
//             //       googleSignIn.onCurrentUserChanged.listen((account) {
//             //         handleSignIn(account);
//             //         print("google sign in on current user change listerner");
//             //       }, onError: (err) {
//             //         print("error occured shit $err");
//             //       });
//             //       googleSignIn
//             //           .signInSilently(suppressErrors: false)
//             //           .then((account) {
//             //         handleSignIn(account);
//             //         print("google sign in silently user change listerner");
//             //       }).catchError((err) {
//             //         print("error occured: ${err.message}");
//             //       });
//             //       // String result = await signInWithGoogle();
//             //       // print("result: $result");

//             //       // googleSignIn.signIn().then((result) {
//             //       //   result.authentication.then((googleKey){
//             //       //     FirebaseAuth.instance

//             //       //   }).catchError((e){print(e.toString());});

//             //       // }).catchError((e) {
//             //       //   print(e.toString());
//             //       // });
//             //     },
//             //     child: Container(
//             //       height: 40,
//             //       width: 220,
//             //       decoration: BoxDecoration(
//             //         border: Border.all(color: Colors.blue),
//             //         image: DecorationImage(
//             //           image: AssetImage("assets/images/googlee.png"),
//             //           fit: BoxFit.cover,
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // RaisedButton(
//             //   color: Colors.black,
//             //   onPressed: () {},
//             //   child: Text(
//             //     "Join with Google",
//             //     style: GoogleFonts.lato(color: Colors.white),
//             //   ),
//             // ),
//             SizedBox(
//               height: 50,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   handleSignIn(GoogleSignInAccount account) {
//     if (account != null) {
//       print("user signed in: $account.");

//       print(account.displayName);
//       // print("the value of auth is ${Contants.isAuth}");
//     } else {
//       // print("the value of auth is ${Contants.isAuth}");
//     }
//   }
// }
