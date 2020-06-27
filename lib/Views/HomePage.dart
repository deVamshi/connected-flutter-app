import 'package:Connected/Views/ClassRooms.dart';
import 'package:Connected/Views/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'NotificationsPage.dart';
import 'package:store_redirect/store_redirect.dart';

//import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [ClassRooms(), Notifications(), Container(), ProfileScreen()];
//  PageController _pageController;
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/mountain.jpg"),
                          fit: BoxFit.cover))),
              ListTile(
                onTap: () {
                  StoreRedirect.redirect(
                      androidAppId: "com.btechbuddy.notemaster");
                },
                leading: Icon(LineAwesomeIcons.google_play),
                title: Text("Rate On Playstore"),
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text("Feedback"),
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.user_plus),
                title: Text("Invite a Friend"),
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.alternate_sign_out),
                title: Text("Log Out"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Connect"),
          elevation: 0,
        ) ,// : AppBar(actions: <Widget>[IconButton(onPressed: (){},icon: Icon(Icons.filter_list),)],),
        
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
                inactiveColor: Colors.grey[600],
                activeColor: Colors.red,
                title: Text("ClassRooms"),
                icon: Icon(LineAwesomeIcons.pencil_ruler)),
            BottomNavyBarItem(
                inactiveColor: Colors.grey[600],
                activeColor: Colors.deepPurple,
                title: Text('Notice Board'),
                icon: Icon(Icons.notifications_none)),
            BottomNavyBarItem(
                inactiveColor: Colors.grey[600],
                activeColor: Colors.pink,
                title: Text('Downloads'),
                icon: Icon(LineAwesomeIcons.download)),
            BottomNavyBarItem(
                inactiveColor: Colors.grey,
                activeColor: Colors.blue,
                title: Text('My Profile'),
                icon: Icon(Icons.person_outline)),
          ],
        )
        // bottomNavigationBar: BottomNavyBar(
        //   selectedIndex: _currentIndex,
        //   onItemSelected: (index) {
        //     setState(() => _currentIndex = index);
        //     //_pageController.jumpToPage(index);
        //   },
        //   items: <BottomNavyBarItem>[
        //     BottomNavyBarItem(
        //         inactiveColor: Colors.grey[600],
        //         activeColor: Colors.red,
        //         title: Text("ClassRooms"),
        //         icon: Icon(Icons.crop_square)),
        //     BottomNavyBarItem(
        //         inactiveColor: Colors.grey[600],
        //         activeColor: Colors.deepPurple,
        //         title: Text('Notice Board'),
        //         icon: Icon(Icons.notifications_none)),
        //     BottomNavyBarItem(
        //         inactiveColor: Colors.grey[600],
        //         activeColor: Colors.pink,
        //         title: Text('Library'),
        //         icon: Icon(Icons.note)),
        //     BottomNavyBarItem(
        //         inactiveColor: Colors.grey,
        //         activeColor: Colors.pink,
        //         title: Text('My Profile'),
        //         icon: Icon(Icons.person_outline)),
        //   ],
        // ),
        );
  }
}
