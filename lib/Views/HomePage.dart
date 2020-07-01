import 'package:Connected/Views/ClassRooms.dart';
import 'package:Connected/Views/ProfileScreen.dart';
import 'package:Connected/Views/staticFields.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'NotificationsPage.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'fade_indexed_stack.dart';

//import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [ClassRooms(), Notifications(), Container(), ProfileScreen()];
  ScrollController c1 = staticFields.barController1;
  ScrollController c2 = staticFields.barController2;
  ScrollController c3 = staticFields.barController3;

//  PageController _pageController;
  void initState() {
    super.initState();

    staticFields.isVisible = true;
    c1.addListener(() {
      if (c1.position.userScrollDirection == ScrollDirection.reverse) {
        if (staticFields.isVisible)
          setState(() {
            staticFields.isVisible = false;
            // print("**** $HomePage.isVisible up");
          });
      }
      if (c1.position.userScrollDirection == ScrollDirection.forward) {
        if (!staticFields.isVisible)
          setState(() {
            staticFields.isVisible = true;
            //print("**** $staticf.isVisible down");
          });
      }
    });
    c2.addListener(() {
      if (c2.position.userScrollDirection == ScrollDirection.reverse) {
        if (staticFields.isVisible)
          setState(() {
            staticFields.isVisible = false;
            // print("**** $HomePage.isVisible up");
          });
      }
      if (c2.position.userScrollDirection == ScrollDirection.forward) {
        if (!staticFields.isVisible)
          setState(() {
            staticFields.isVisible = true;
            //print("**** $staticf.isVisible down");
          });
      }
    });
    c3.addListener(() {
      if (c3.position.userScrollDirection == ScrollDirection.reverse) {
        if (staticFields.isVisible)
          setState(() {
            staticFields.isVisible = false;
            // print("**** $HomePage.isVisible up");
          });
      }
      if (c3.position.userScrollDirection == ScrollDirection.forward) {
        if (!staticFields.isVisible)
          setState(() {
            staticFields.isVisible = true;
            //print("**** $staticf.isVisible down");
          });
      }
    });
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //   child: ListView(
        //     children: <Widget>[
        //       Container(
        //           height: 150,
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                   image: AssetImage("assets/images/mountain.jpg"),
        //                   fit: BoxFit.cover))),
        //       ListTile(
        //         onTap: () {
        //           StoreRedirect.redirect(
        //               androidAppId: "com.btechbuddy.notemaster");
        //         },
        //         leading: Icon(LineAwesomeIcons.google_play),
        //         title: Text("Rate On Playstore"),
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.feedback),
        //         title: Text("Feedback"),
        //       ),
        //       ListTile(
        //         leading: Icon(LineAwesomeIcons.user_plus),
        //         title: Text("Invite a Friend"),
        //       ),
        //       ListTile(
        //         leading: Icon(LineAwesomeIcons.alternate_sign_out),
        //         title: Text("Log Out"),
        //       ),
        //     ],
        //   ),
        // ),
        body: FadeIndexedStack(
          //this is optional
          // duration: Duration(seconds: 1),
          children: screens.map((t) => t).toList(),
          index: _currentIndex,
        ),

        //screens[_currentIndex],
        bottomNavigationBar: AnimatedContainer(
          // decoration: BoxDecoration(borderRadius: Border),
          duration: Duration(milliseconds: 300),
          height: staticFields.isVisible ? 55 : 0,
          child: staticFields.isVisible
              ? BottomNavyBar(
                  selectedIndex: _currentIndex,
                  itemCornerRadius: 5,
                  showElevation: false,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // containerHeight: 50,
                  //backgroundColor: Color(0xff2b2f77),
                  // animationDuration: Duration(milliseconds: 400),
                  // containerHeight: 50,
                  // curve: Curves.easeInBack,
                  onItemSelected: (index) {
                    setState(() => _currentIndex = index);
                    //_pageController.jumpToPage(index);
                  },
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey[600],
                        activeColor: Color(0xff2b2f77),
                        title: Text("ClassRooms"),
                        icon: Icon(LineAwesomeIcons.pencil_ruler)),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey[600],
                        activeColor: Color(0xff2b2f77),
                        title: Text('Notifications'),
                        icon: Icon(LineAwesomeIcons.list)),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey[600],
                        activeColor: Color(0xff2b2f77),
                        title: Text('Downloads'),
                        icon: Icon(LineAwesomeIcons.download)),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey,
                        activeColor: Color(0xff2b2f77),
                        title: Text('My Profile'),
                        icon: Icon(LineAwesomeIcons.user)),
                  ],
                )
              : Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                ),
        ));
    //   bottomNavigationBar: FFNavigationBar(
    //     theme: FFNavigationBarTheme(
    //       barBackgroundColor: Colors.white,
    //       selectedItemBorderColor: Color(0xffdde7ee),
    //       selectedItemBackgroundColor: Color(0xff2b2f77),
    //       selectedItemIconColor: Colors.white,
    //       selectedItemLabelColor: Color(0xff2b2f77),
    //       barHeight: 50,
    //     ),
    //     selectedIndex: _currentIndex,
    //     onSelectTab: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //     items: [
    //       FFNavigationBarItem(
    //         iconData: Icons.calendar_today,
    //         label: '',
    //         // animationDuration: Duration(seconds: 5),
    //       ),
    //       FFNavigationBarItem(
    //         iconData: Icons.people,
    //         label: '',
    //       ),
    //       FFNavigationBarItem(
    //         iconData: Icons.attach_money,
    //         label: '',
    //       ),
    //       FFNavigationBarItem(
    //         iconData: Icons.note,
    //         label: '',
    //       ),
    //     ],
    //   ),
    // );

    // BottomNavyBar(
    //  // backgroundColor: Color(0xffdde7ee),
    //   selectedIndex: _currentIndex,
    //   showElevation: true,
    //   onItemSelected: (index) => setState(() {
    //     _currentIndex = index;
    //   }),
    //   items: [
    //     BottomNavyBarItem(
    //         inactiveColor: Colors.grey[600],
    //         activeColor: Color(0xff2b2f77),
    //         title: Text("ClassRooms"),
    //         icon: Icon(LineAwesomeIcons.pencil_ruler)),
    //     BottomNavyBarItem(
    //         inactiveColor: Colors.grey[600],
    //         activeColor: Color(0xff2b2f77),
    //         title: Text('Notice Board'),
    //         icon: Icon(Icons.notifications_none)),
    //     BottomNavyBarItem(
    //         inactiveColor: Colors.grey[600],
    //         activeColor: Color(0xff2b2f77),
    //         title: Text('Downloads'),
    //         icon: Icon(LineAwesomeIcons.download)),
    //     BottomNavyBarItem(
    //         inactiveColor: Colors.grey,
    //         activeColor: Color(0xff2b2f77),
    //         title: Text('Me'),
    //         icon: Icon(Icons.person_outline)),
    //   ],
    // )
    // bottomNavigationBar:   TitledBottomNavigationBar(
    //             enableShadow: false,
    //             reverse: true,
    //             inactiveColor: Colors.grey,
    //             activeColor: Color(0xff2b2f77),
    //             currentIndex:
    //                 _currentIndex, // Use this to update the Bar giving a position
    //             onTap: (index) {
    //               setState(() {
    //                 _currentIndex = index;
    //               });
    //             },
    //             items: [
    //                 TitledNavigationBarItem(
    //                     title: Text('Classes'),
    //                     icon: LineAwesomeIcons.pencil_ruler),
    //                 TitledNavigationBarItem(
    //                     title: Text('Notice Board'),
    //                     icon: Icons.notifications_none),
    //                 TitledNavigationBarItem(
    //                     title: Text('Downloads'),
    //                     icon: LineAwesomeIcons.download),
    //                 TitledNavigationBarItem(
    //                     title: Text('Me'),
    //                     icon: LineAwesomeIcons.user_circle),
    //                 //  TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
    //               ])
    // );
  }
}
