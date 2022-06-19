// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redhopper_app/UI/pages/tab_bar_pages/feed_page.dart';
import 'package:redhopper_app/UI/pages/tab_bar_pages/resource_page.dart';
import 'package:redhopper_app/UI/pages/tab_bar_pages/review_page.dart';
import 'package:redhopper_app/UI/widgets/event_detail_upper_body.dart';
import 'package:redhopper_app/UI/widgets/discover_event_card.dart';
import 'package:redhopper_app/core/models/event_model.dart';

class _SliverColorTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverColorTabBarDelegate(this._coloredTabBar);
  final ColoredTabBar _coloredTabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(child: _coloredTabBar);
  }

  @override
  double get minExtent => _coloredTabBar.preferredSize.height;
  @override
  double get maxExtent => _coloredTabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}

class _EventUpperDetailDelegate extends SliverPersistentHeaderDelegate {
  final EventData eventData;
  _EventUpperDetailDelegate({required this.eventData});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SingleChildScrollView(
      child: EventDetailUpperBody(
        eventData: eventData,
      ),
    );
  }

  @override
  double get minExtent => 280;
  @override
  double get maxExtent => 280;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class EventDetailPage extends StatefulWidget {
  final EventData eventInfo;
  const EventDetailPage({Key? key, required this.eventInfo}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: false,
                delegate: _EventUpperDetailDelegate(
                  eventData: widget.eventInfo,
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverColorTabBarDelegate(
                  ColoredTabBar(
                    Colors.white,
                    TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "FEED"),
                        Tab(text: "REVIEWS"),
                        Tab(text: "RESOURCE"),
                      ],
                    ),
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              FeedPage(),
              ReviewPage(),
              ResourcePage(),
            ],
          ),
        ),
      ),
    );
  }
}
