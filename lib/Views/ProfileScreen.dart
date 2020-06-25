import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profileInfo = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110,
            width: 110,
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/sophia.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 30,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: 15, //kSpacingUnit.w * 1.5,
                      widthFactor: 15, //kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: Colors.black,
                        size: 18,
                        // size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Nicolas Adams',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600), //kTitleTextStyle,
          ),
          SizedBox(height: 5),
          Text(
            'nicolasadams@gmail.com',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600), //kCaptionTextStyle,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        profileInfo,
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                //header,
                ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite a Friend',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  // );
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59, //kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(horizontal: 0 //kSpacingUnit.w * 4,
              )
          .copyWith(bottom: 1 //kSpacingUnit.w * 2,
              ),
      padding: EdgeInsets.symmetric(horizontal: 21 //kSpacingUnit.w * 2,
          ),

      child: Row(
        children: <Widget>[
          Icon(this.icon, size: 27 // kSpacingUnit.w * 2.5,
              ),
          SizedBox(width: 16), //kSpacingUnit.w * 1.5),
          Text(this.text,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600) // kTitleTextStyle.copyWith(
              //   fontWeight: FontWeight.w500,
              // ),
              ),
          Spacer(),
          if (this.hasNavigation)
            Icon(LineAwesomeIcons.angle_right, size: 26 //kSpacingUnit.w * 2.5,
                ),
        ],
      ),
    );
  }
}
