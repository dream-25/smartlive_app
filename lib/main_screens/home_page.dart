import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartlive/home_pages/account.dart';
import 'package:smartlive/home_pages/explore.dart';
import 'package:smartlive/home_pages/home.dart';
import 'package:smartlive/home_pages/new.dart';
import 'package:smartlive/home_pages/stories.dart';

// ignore: must_be_immutable
class HomeRootPage extends StatefulWidget {
  int pageIndex;
  HomeRootPage({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<HomeRootPage> createState() => _HomeRootPageState();
}

class _HomeRootPageState extends State<HomeRootPage> {
  List pages = [
    const HomePage(),
    const Stories(),
    const NewPage(),
    const ExplorePage(),
    const AccountPage(),
  ];
  Future<void> _getUserNuumber() async {}

  @override
  void initState() {
    super.initState();
    _getUserNuumber();
  }

  @override
  Widget build(BuildContext context) {
    int myIndex = widget.pageIndex;
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.red[300]!,
                hoverColor: Colors.red[100]!,
                gap: 8,
                activeColor: Colors.red,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.red[100]!,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.alternateTicket,
                    text: 'Bookings',
                  ),
                  GButton(
                    icon: LineIcons.history,
                    text: 'History',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: myIndex,
                onTabChange: (index) {
                  setState(() {
                    widget.pageIndex = index;
                    myIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        body: SafeArea(child: pages[myIndex]));
  }
}

void logout(String key, String value) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
