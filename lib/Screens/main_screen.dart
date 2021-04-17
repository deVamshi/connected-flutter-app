import 'package:Connected/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'notifications.dart';
import 'downloads.dart';
import 'widgets.dart';
import 'bunk_manager.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;
  var screens = [
    Home(),
    Downloads(),
    BunkManager(),
  ];
  // bool hasNotifs = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  //builds widgets

  setLogInState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool logInState = prefs.getBool("isAuth");
    // print(logInState);
    await prefs.setBool("isAuth", false);
    bool logInStateafter = prefs.getBool("isAuth");
    print("logInStateafter $logInStateafter");
  }

  // setLogInStateHiveBox() async {
  //   if (HiveBoxes.userPrefsHiveBox.isOpen) {
  //     HiveBoxes.userPrefsHiveBox.put("isAuth", false);
  //     bool result = HiveBoxes.userPrefsHiveBox.get("isAuth");
  //     print("hive result set log in state while logging out $result");
  //     // await HiveBoxes.userPrefsHiveBox.close();
  //   } else {
  //     print("ikkada");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    AppBar _buildMainPageAppBar(BuildContext bc, String title) {
      return AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[850],
        title: Text(
          title,
          style: GoogleFonts.lato(letterSpacing: 2, color: Colors.white),
        ),
      );
    }

    handleOnPageChanged(int index) {
      setState(() {
        this._currentIndex = index;
      });
    }

    handleOnTap(int tappedIndex) {
      _pageController.jumpToPage(tappedIndex);

      setState(() {
        this._currentIndex = tappedIndex;
      });
    }

    return SafeArea(
      child: Scaffold(
        drawer: buildDrawer(context),
        backgroundColor: Colors.white,
        //  _currentIndex == 0 ? Colors.white : Colors.white,
        // // NewColors.scaffoldBgColor,
        appBar: _currentIndex == 0
            ? null
            : _currentIndex == 1
                ? buildAppBar("Downloads")
                : buildAppBar("Bunk Manager"),

        // drawer: buildDrawer(context),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: Color(0xffe43f5a),
        //   child: Icon(LineAwesomeIcons.plus),
        // ),
        body: screens[_currentIndex],
        //  FadeIndexedStack(
        //   //this is optional
        //   // duration: Duration(seconds: 1),
        //   children: screens.map((t) => t).toList(),
        //   index: _currentIndex,
        // ),
        //     PageView(
        //   controller: _pageController,
        //   onPageChanged: handleOnPageChanged,
        //   physics: NeverScrollableScrollPhysics(),
        //   children: <Widget>[
        //     Home(),
        //     Downloads(),
        //     Notifications(),
        //     ProfileScreen(),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // getListOfPdfs();
        //     dislikeFunc();
        //   },
        //   child: Icon(Icons.add),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // elevation: 0.0,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          selectedItemColor: NewColors.bottomBarTextColor,
          // Color(0xff2b2f77),
          unselectedItemColor: NewColors.bottomBarUnSelectedTextColor,
          backgroundColor: NewColors.bottomBarColor,

          items: [
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.home),
              title: Text(
                "Home",
                style: GoogleFonts.lato(
                  fontSize: 12,
                  // color: Colors.black,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.arrow_down
                  // Icons.arrow_downward,
                  ),
              title: Text(
                "Downloads",
                style: GoogleFonts.lato(
                  fontSize: 12,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.otter),
              title: Text(
                "Bunk Manager",
                style: GoogleFonts.lato(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        //   BottomNavyBar(
        //     selectedIndex: _currentIndex,
        //     showElevation: true,
        //     animationDuration: Duration(milliseconds: 500),
        //     itemCornerRadius: 50,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     backgroundColor: Colors.grey[800],
        //     curve: Curves.easeIn,
        //     onItemSelected: (index) {
        //       // handleOnTap(index);
        //       setState(() {
        //         _currentIndex = index;
        //       });
        //       // _pageController.jumpToPage(index);
        //       // _pageController.animateToPage(_currentIndex,
        //       //     duration: Duration(milliseconds: 10), curve: Curves.easeInBack);
        //     },
        //     items: [
        //       BottomNavyBarItem(
        //         icon: Icon(LineAwesomeIcons.home),
        //         title: Text('Home'),
        //         activeColor: Colors.white,
        //         inactiveColor: Colors.grey[500],
        //         textAlign: TextAlign.center,
        //       ),
        //       BottomNavyBarItem(
        //         icon: Icon(LineAwesomeIcons.download),
        //         title: Text('Downloads'),
        //         activeColor: Colors.white,
        //         inactiveColor: Colors.grey[500],
        //         textAlign: TextAlign.center,
        //       ),
        //       BottomNavyBarItem(
        //         icon: Icon(LineAwesomeIcons.bell),
        //         title: Text(
        //           'Inbox',
        //         ),
        //         activeColor: Colors.white,
        //         inactiveColor: Colors.grey[500],
        //         textAlign: TextAlign.center,
        //       ),
        //       BottomNavyBarItem(
        //         icon: Icon(LineAwesomeIcons.user),
        //         title: Text('Account'),
        //         activeColor: Colors.white,
        //         inactiveColor: Colors.grey[500],
        //         textAlign: TextAlign.center,
        //       ),
        //     ],
        //   ),
        // );
        //     TitledBottomNavigationBar(
        //   activeColor: Colors.white,
        //   // Color(0xffe43f5a),
        //   // indicatorColor: Colors.grey[850],
        //   inactiveColor: Colors.grey[400],
        //   inactiveStripColor: Colors.grey[850],
        //   reverse: true,
        //   currentIndex: _currentIndex,
        //   curve: Curves.easeInBack,
        //   onTap: (value) {
        //     // print(value);
        //     setState(() {
        //       this._currentIndex = value;
        //     });
        //     // _pageController.animateToPage(value,
        //     //     duration: Duration(milliseconds: 101), curve: Curves.easeInBack);
        //   },
        //   items: [
        //     TitledNavigationBarItem(
        //       backgroundColor: Colors.grey[800],
        //       icon: LineAwesomeIcons.home,
        //       title: Text("Home"),
        //     ),
        //     TitledNavigationBarItem(
        //       backgroundColor: Colors.grey[800],
        //       icon: LineAwesomeIcons.download,
        //       title: Text("Downloads"),
        //     ),
        //     TitledNavigationBarItem(
        //       backgroundColor: Colors.grey[800],
        //       icon: LineAwesomeIcons.bell,
        //       title: Text("Inbox"),
        //     ),
        //     // TitledNavigationBarItem(
        //     //   backgroundColor: Colors.grey[800],
        //     //   icon: LineAwesomeIcons.user,
        //     //   title: Text("Account"),
        //     // ),
        //   ],
        // ),
      ),
    );
    // FFNavigationBar(
    //   theme: FFNavigationBarTheme(
    //     barBackgroundColor: Colors.grey[800],
    //     selectedItemBorderColor: Colors.transparent,
    //     selectedItemBackgroundColor: Colors.grey[850],
    //     selectedItemIconColor: Colors.white,
    //     selectedItemLabelColor: Colors.grey[100],
    //   ),
    //   selectedIndex: _currentIndex,
    //   onSelectTab: (index) {
    //     _pageController.jumpToPage(index);

    //     setState(() {
    //       _currentIndex = index;
    //     });
    //   },
    //   items: [
    //     FFNavigationBarItem(
    //       iconData: LineAwesomeIcons.home,
    //       label: 'Home',
    //     ),
    //     FFNavigationBarItem(
    //       iconData: LineAwesomeIcons.download,
    //       label: 'Downloads',
    //     ),
    //     FFNavigationBarItem(
    //       iconData: LineAwesomeIcons.bell,
    //       label: 'Inbox',
    //     ),
    //     FFNavigationBarItem(
    //       iconData: LineAwesomeIcons.user,
    //       label: 'Account',
    //     ),
    //   ],
    // ),

    //  TitledBottomNavigationBar(
    //   reverse: true,
    //   currentIndex: _currentIndex,
    //   curve: Curves.easeIn,
    //   onTap: (value) {
    //     _pageController.jumpToPage(value);

    //     setState(() {
    //       this._currentIndex = value;
    //     });
    //   },
    //   items: [
    //     TitledNavigationBarItem(
    //       icon: LineAwesomeIcons.home,
    //       title: Text("Home"),
    //     ),
    //     TitledNavigationBarItem(
    //       icon: LineAwesomeIcons.download,
    //       title: Text("Donwloads"),
    //     ),
    //     TitledNavigationBarItem(
    //       icon: LineAwesomeIcons.bell,
    //       title: Text("Inbox"),
    //     ),
    //     TitledNavigationBarItem(
    //       icon: LineAwesomeIcons.user,
    //       title: Text("Account"),
    //     ),
    //   ],
    // )
    // PersistentBottomNavBar(
    //   decoration: NavBarDecoration(),
    //   itemAnimationProperties: ItemAnimationProperties(
    //     curve: Curves.easeIn,
    //     duration: Duration(milliseconds: 500),
    //   ),
    //   navBarHeight: 60,
    //   onItemSelected: (value) {
    //     _pageController.jumpToPage(value);

    //     setState(() {
    //       this._currentIndex = value;
    //     });
    //   },
    //   backgroundColor: Colors.white,
    //   selectedIndex: _currentIndex,
    //   navBarStyle: NavBarStyle.style7,
    //   items: [
    //     PersistentBottomNavBarItem(

    //         // onPressed: (value) {
    //         //   _pageController.jumpToPage(value);

    //         //   setState(() {
    //         //     this._currentIndex = value;
    //         //   });
    //         // },
    //         activeContentColor: Colors.white,
    //         activeColor: Colors.black,
    //         icon: Icon(Icons.home),
    //         title: "String"),
    //     PersistentBottomNavBarItem(
    //         // onPressed: (value) {
    //         //   _pageController.jumpToPage(value);

    //         //   setState(() {
    //         //     this._currentIndex = value;
    //         //   });
    //         // },
    //         activeContentColor: Colors.white,
    //         activeColor: Colors.black,
    //         icon: Icon(Icons.file_download),
    //         title: "Downloads"),
    //     PersistentBottomNavBarItem(
    //         // onPressed: (value) {
    //         //   _pageController.jumpToPage(value);

    //         //   setState(() {
    //         //     this._currentIndex = value;
    //         //   });
    //         // },
    //         activeContentColor: Colors.white,
    //         activeColor: Colors.black,
    //         icon: Icon(Icons.notifications_active),
    //         title: "Notifications"),
    //     PersistentBottomNavBarItem(
    //         // onPressed: (value) {
    //         //   _pageController.jumpToPage(value);

    //         //   setState(() {
    //         //     this._currentIndex = value;
    //         //   });
    //         // },
    //         activeContentColor: Colors.white,
    //         activeColor: Colors.black,
    //         icon: Icon(Icons.person),
    //         title: "Profile"),
    //   ],
    // ),
    //     BottomNavigationBar(
    //   currentIndex: _currentIndex,
    //   onTap: handleOnTap,
    //   selectedItemColor: Colors.black,
    //   // Color(0xff2b2f77),
    //   unselectedItemColor: AppColor.inActiveColor,
    //   backgroundColor: Colors.white,
    //   elevation: 10,
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         _currentIndex == 0 ? Icons.home : LineAwesomeIcons.home,
    //       ),
    //       title: Text(
    //         "Home",
    //         style: GoogleFonts.lato(
    //           fontSize: 12,
    //           // color: Colors.black,
    //         ),
    //       ),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         _currentIndex == 1
    //             ? Icons.file_download
    //             : LineAwesomeIcons.download,
    //         // Icons.arrow_downward,
    //       ),
    //       title: Text(
    //         "Downloads",
    //         style: GoogleFonts.lato(
    //           fontSize: 12,
    //         ),
    //       ),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         _currentIndex == 2
    //             ? Icons.notifications
    //             : Icons.notifications_none,
    //       ),
    //       title: Text(
    //         "Inbox",
    //         style: GoogleFonts.lato(
    //           fontSize: 12,
    //         ),
    //       ),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         _currentIndex == 3 ? Icons.person : Icons.person_outline,
    //       ),
    //       title: Text(
    //         "Account",
    //         style: GoogleFonts.lato(
    //           fontSize: 12,
    //           color: Colors.black,
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  }

  // void _openPopup(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       backgroundColor: Colors.white,
  //       builder: (BuildContext bc) {
  //         return Container(
  //           height: MediaQuery.of(context).size.height * 0.6,
  //           child: Center(
  //             child: ListView(
  //               // crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //                   child: Text(
  //                     "Select your branch",
  //                     style: GoogleFonts.lato(fontSize: 20, color: Colors.red),
  //                   ),
  //                 ),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //                 customBranchTile(context),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
}
