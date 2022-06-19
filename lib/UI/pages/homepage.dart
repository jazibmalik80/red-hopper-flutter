// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/UI/pages/event_detail_page.dart';
import 'package:redhopper_app/UI/pages/login_page.dart';
import 'package:redhopper_app/UI/widgets/custom_search_bar.dart';
import 'package:redhopper_app/UI/widgets/event_card.dart';
import 'package:redhopper_app/UI/widgets/home_main_event_card.dart';
import 'package:redhopper_app/UI/widgets/homepage_shimmer.dart';
import 'package:redhopper_app/UI/widgets/discover_event_card.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/view_models/auth_viewmodel.dart';
import 'package:redhopper_app/core/view_models/discover_events_viewmodel.dart';
import 'package:redhopper_app/core/view_models/main_event_viemodel.dart';
import 'package:redhopper_app/core/view_models/my_events_list_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                final snackBar = SnackBar(content: Text("Logged out"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                await Provider.of<AuthViewModel>(context, listen: false)
                    .logOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      children: [
                        CustomSearchBar(),
                        SizedBox(height: 10),
                        ChangeNotifierProvider<MainEventViewModel?>(
                          create: (context) =>
                              MainEventViewModel()..getEventData(),
                          child: Consumer<MainEventViewModel>(
                            builder: (context, viewmodel, child) => viewmodel
                                        .view_state ==
                                    viewState.busy
                                ? Center(
                                    child: HomepageShimmer(),
                                  )
                                : InkWell(
                                    child: HomeMainEventCard(
                                      eventName: viewmodel.eventModel!.data!
                                          .elementAt(0)
                                          .title
                                          .toString(),
                                      eventDescription: viewmodel
                                          .eventModel!.data!
                                          .elementAt(0)
                                          .description
                                          .toString(),
                                      eventStartDate: viewmodel
                                          .eventModel!.data!
                                          .elementAt(0)
                                          .startDate
                                          .toString(),
                                      eventEndDate: viewmodel.eventModel!.data!
                                          .elementAt(0)
                                          .endDate
                                          .toString(),
                                      eventLocation: viewmodel.eventModel!.data!
                                              .elementAt(0)
                                              .city
                                              .toString() +
                                          ", " +
                                          viewmodel.eventModel!.data!
                                              .elementAt(0)
                                              .country
                                              .toString(),
                                      eventStatus: viewmodel.eventModel!.data!
                                          .elementAt(0)
                                          .eventStatus
                                          .toString(),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EventDetailPage(
                                            eventInfo: viewmodel
                                                .eventModel!.data!
                                                .elementAt(0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Chip(
                              label: Text('All'),
                            ),
                            SizedBox(width: 3),
                            Chip(
                              label: Text('Events'),
                            ),
                            SizedBox(width: 3),
                            Chip(
                              label: Text('Upcomming'),
                            ),
                            SizedBox(width: 2),
                            Chip(
                              label: Text('Related'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 304.0,
                          child: ChangeNotifierProvider<MyEventListViewModel?>(
                            create: (context) =>
                                MyEventListViewModel()..getMyEventsData(),
                            child: Consumer<MyEventListViewModel>(
                              builder: (context, viewmodel, child) =>
                                  viewmodel.view_state == viewState.busy
                                      ? Center(
                                          child: HomepageShimmer(),
                                        )
                                      : ListView.builder(
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: viewmodel
                                              .myeventModel!.data!.length,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              InkWell(
                                            child: EventCard(
                                              eventData: viewmodel
                                                  .myeventModel!.data!
                                                  .elementAt(index),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventDetailPage(
                                                    eventInfo: viewmodel
                                                        .myeventModel!.data!
                                                        .elementAt(index),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Color(0xFFD6E4FF),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Discover Events',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ChangeNotifierProvider<DiscoverEventViewModel?>(
                          create: (context) =>
                              DiscoverEventViewModel()..getDiscoverEventsData(),
                          child: Consumer<DiscoverEventViewModel>(
                            builder: (context, viewmodel, child) =>
                                viewmodel.view_state == viewState.busy
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : DiscoverEventCard(
                                        eventTitle: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .title
                                            .toString(),
                                        eventDescription: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .description
                                            .toString(),
                                        eventVenue: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .venue
                                            .toString(),
                                        eventStartDate: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .startDate
                                            .toString(),
                                        eventEndDate: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .endDate
                                            .toString(),
                                        city: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .city
                                            .toString(),
                                        country: viewmodel
                                            .discoverEventModel!.data!
                                            .elementAt(0)
                                            .country
                                            .toString(),
                                      ),
                          ),
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
