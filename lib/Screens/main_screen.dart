import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'notifications.dart';
import 'package:Connected/animations/fade_indexed_stack.dart';
import 'downloads.dart';
import 'widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  //PageController _pageController;
  var screens = [Home(),Downloads(),Notifications()];

  handleOnTap(int tappedIndex) {
    // _pageController.animateToPage(tappedIndex,
    //     duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    setState(() {
      this._currentIndex = tappedIndex;
    });
  }

  // hadleOnPageChanged(int pageIndex) {
  //   setState(() {
  //     this._currentIndex = pageIndex;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //_pageController = PageController();
  }

  //builds widgets
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Notepedia"),
      drawer: buildDrawer(),
 
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
        selectedItemColor: Color(0xff2b2f77),
        unselectedItemColor: Colors.grey,
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
                color: Colors.black,
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
    );
  }
}
