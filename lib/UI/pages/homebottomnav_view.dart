// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redhopper_app/UI/pages/chat_page.dart';
import 'package:redhopper_app/UI/pages/homepage.dart';
import 'package:redhopper_app/UI/pages/profile_page.dart';

class HomeBottomNavView extends StatefulWidget {
  const HomeBottomNavView({Key? key}) : super(key: key);

  @override
  _HomeBottomNavViewState createState() => _HomeBottomNavViewState();
}

class _HomeBottomNavViewState extends State<HomeBottomNavView> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          ChatPage(),
          ProfilePage(),
        ],
        onPageChanged: onPageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: itemTapped,
        currentIndex: selectedindex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Color(0x99000000)),
        showSelectedLabels: true,
        unselectedItemColor: Color(0x99000000),
      ),
    );
  }

  PageController pageController = PageController();

  void onPageChange(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  void itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }
}
