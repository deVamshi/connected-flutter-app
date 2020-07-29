

import 'package:Connected/colors.dart';
import 'package:Connected/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'notifications.dart';
import 'package:Connected/animations/fade_indexed_stack.dart';
import 'downloads.dart';
import 'widgets.dart';
import 'package:Connected/DatabaseMethods/auth.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  //PageController _pageController;
  var screens = [Home(), Downloads(), Notifications()];

  handleOnTap(int tappedIndex) {
    // _pageController.animateToPage(tappedIndex,
    //     duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    setState(() {
      this._currentIndex = tappedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    //_pageController = PageController();
    // googleSignIn.onCurrentUserChanged.listen((account) {
    //   handleSignIn(account);
    //   print("google sign in on current user change listerner");
    // }, onError: (err) {
    //   print("error occured shit $err");
    // });
    // googleSignIn.signInSilently(suppressErrors: false).then((account) {
    //   handleSignIn(account);
    //   print("google sign in silently user change listerner");
    // }).catchError((err) {
    //   print("error occured: ${err.message}");
    // });
  }


  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print("user signed in: $account.");
      setState(() {
        Contants.isAuth = true;
      });
      print(account.displayName);
      print("the value of auth is ${Contants.isAuth}");
    } else {
      setState(() {
        Contants.isAuth = false;
      });
      print("the value of auth is ${Contants.isAuth}");
    }
  }

  //builds widgets

  @override
  Widget build(BuildContext context) {
    AppBar _buildMainPageAppBar(String title) {
      return AppBar(
        iconTheme: IconThemeData(color: AppColor.headerColor),
        backgroundColor: AppColor.mainColor,
        // blue color 0xff2b2f77
        elevation: 0.0,
        //centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.lato(letterSpacing: 2, color: AppColor.headerColor),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _openPopup(context);
            },
            icon: Icon(LineAwesomeIcons.filter),
          ),
         
        ],
      );
    }

    return Scaffold(
      appBar: _buildMainPageAppBar("Notepedia"),
      drawer: buildDrawer(context),

      body: FadeIndexedStack(
        //this is optional
        // duration: Duration(seconds: 1),
        children: screens.map((t) => t).toList(),
        index: _currentIndex,
      ),

      //  PageView(
      //   controller: _pageController,
      //   onPageChanged: hadleOnPageChanged,
      //   physics: NeverScrollableScrollPhysics(),
      //   children: <Widget>[
      //     Home(),
      //     Downloads(),
      //     Notifications(),
      //     //Profile(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: handleOnTap,
        selectedItemColor: AppColor.activeColor,
        unselectedItemColor: AppColor.inActiveColor,
        backgroundColor: Colors.white,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps,
            ),
            title: Text(
              "Home",
              style: GoogleFonts.lato(
                fontSize: 12,
                // color: Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_downward,
            ),
            title: Text(
              "Downloads",
              style: GoogleFonts.lato(
                fontSize: 12,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none,
            ),
            title: Text(
              "Notifications",
              style: GoogleFonts.lato(
                fontSize: 12,
              ),
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.person_outline,
          //   ),
          //   title: Text(
          //     "Profile",
          //     style: GoogleFonts.lato(
          //       fontSize: 12,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //     DynamicTheme.of(context).setBrightness(
      //     Theme.of(context).brightness == Brightness.dark
      //         ? Brightness.light
      //         : Brightness.dark);
      //         print("darkmode thouche");
      // },),
    );
  }

  void _openPopup(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Text("Select your branch",style: GoogleFonts.lato(fontSize: 20,color: Colors.red),),),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                  customBranchTile(context),
                
                ],
              ),
            ),
          );
        });
  }
}