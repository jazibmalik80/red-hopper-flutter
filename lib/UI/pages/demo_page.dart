// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:redhopper_app/UI/pages/tab_bar_pages/feed_page.dart';
import 'package:redhopper_app/UI/pages/tab_bar_pages/resource_page.dart';
import 'package:redhopper_app/UI/pages/tab_bar_pages/review_page.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[700]!.withOpacity(0.4),
          elevation: 0,
          // give the app bar rounded corners
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          leading: Icon(
            Icons.menu,
          ),
        ),
        body: Column(
          children: <Widget>[
            // construct the profile details widget here
            SizedBox(
              height: 180,
              child: Center(
                child: Text(
                  'Profile Details Goes here',
                ),
              ),
            ),
            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: "FEED"),
                    Tab(text: "REVIEWS"),
                    Tab(text: "RESOURCE"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FeedPage(),
                  ReviewPage(),
                  ResourcePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
