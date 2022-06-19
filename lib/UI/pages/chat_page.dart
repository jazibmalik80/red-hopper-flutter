// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/UI/pages/demo_page.dart';
import 'package:redhopper_app/UI/pages/event_detail_page.dart';
import 'package:redhopper_app/UI/widgets/homepage_shimmer.dart';
import 'package:redhopper_app/UI/widgets/discover_event_card.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/view_models/discover_events_viewmodel.dart';
import 'package:redhopper_app/core/view_models/upcomming_event_viewmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 10),
            ChangeNotifierProvider<DiscoverEventViewModel?>(
              create: (context) =>
                  DiscoverEventViewModel()..getDiscoverEventsData(),
              child: Consumer<DiscoverEventViewModel>(
                builder: (context, viewmodel, child) => viewmodel.view_state ==
                        viewState.busy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Flexible(
                        child: ListView.builder(
                          itemCount: viewmodel.discoverEventModel!.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: DiscoverEventCard(
                                eventTitle: viewmodel.discoverEventModel!.data!
                                    .elementAt(index)
                                    .title
                                    .toString(),
                                eventDescription: viewmodel
                                    .discoverEventModel!.data!
                                    .elementAt(index)
                                    .description
                                    .toString(),
                                eventVenue: viewmodel.discoverEventModel!.data!
                                    .elementAt(index)
                                    .venue
                                    .toString(),
                                eventStartDate: viewmodel
                                    .discoverEventModel!.data!
                                    .elementAt(index)
                                    .startDate
                                    .toString(),
                                eventEndDate: viewmodel
                                    .discoverEventModel!.data!
                                    .elementAt(index)
                                    .endDate
                                    .toString(),
                                city: viewmodel.discoverEventModel!.data!
                                    .elementAt(0)
                                    .city
                                    .toString(),
                                country: viewmodel.discoverEventModel!.data!
                                    .elementAt(0)
                                    .country
                                    .toString(),
                              ),
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => LargeShimmerOne(),
                                //   ),
                                // );
                              },
                            );
                          },
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
