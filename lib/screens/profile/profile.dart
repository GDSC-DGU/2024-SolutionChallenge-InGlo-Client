import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inglo/models/profile/user.dart';
import 'package:inglo/screens/profile/widgets/mydrawing.dart';
import 'package:inglo/screens/profile/widgets/myposts.dart';
import 'package:inglo/screens/profile/widgets/setting.dart';
import 'package:inglo/util/profile/user_preferences.dart';
import 'package:inglo/widgets/appbar/appbar.dart';
import 'package:inglo/widgets/profile/numbers_widget.dart';
import 'package:inglo/widgets/profile/percent.dart';
import 'package:inglo/widgets/profile/profile_widget.dart';
import 'package:inglo/widgets/profile/button_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      body: Container(
        color: Color(0xFFF7EEDE),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(
                left: 30.0,
                top: 0,
                right: 30.0,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NumbersWidget(user: user),
                  Column(
                    children: [
                      ProfileWidget(
                        imagePath: user.profile_img,
                      ),
                    ],
                  ),
                  PercentWidget(user: user),
                ],
              ),
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 20),
            buildAbout(user),
          ],
        ),
      ),
      bottomNavigationBar: NavigationAppBar(
        currentIndex: 3, // index 전송
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ],
      );

  Widget buildAbout(User user) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                color: Colors.white, // 상자 색
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    ButtonWidget(
                      text: 'My Sketchs',
                      color: 'D55382',
                      bg: 'EDD2DB',
                      icon1: Icons.draw,
                      icon2: Icons.arrow_forward_ios,
                      onPressed: () {
                        // My Sketchs 버튼이 눌렸을 때 처리할 내용
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyDrawing(),
                          ),
                        );
                      },
                    ),
                    ButtonWidget(
                      text: 'My Posts',
                      color: '8584DF',
                      bg: 'D4D6F5',
                      icon1: Icons.signpost,
                      icon2: Icons.arrow_forward_ios,
                      onPressed: () {
                        // My Sketchs 버튼이 눌렸을 때 처리할 내용
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPosting(),
                          ),
                        );
                      },
                    ),
                    ButtonWidget(
                      text: 'Language',
                      color: '000000',
                      bg: 'C4C4C4',
                      icon1: Icons.language_outlined,
                      icon2: Icons.arrow_forward_ios,
                      onPressed: () {
                        // My Sketchs 버튼이 눌렸을 때 처리할 내용
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Setting(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
