// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/view_models/upcomming_event_viewmodel.dart';

class DiscoverEventCard extends StatelessWidget {
  final String eventTitle;
  final String eventDescription;
  final String eventVenue;
  final String eventStartDate;
  final String eventEndDate;
  final String city;
  final String country;
  const DiscoverEventCard({
    required this.eventTitle,
    required this.eventDescription,
    required this.eventVenue,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.city,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0),
              topRight: Radius.circular(6.0),
            ),
            child: Image.network(
              'https://picsum.photos/290/100',
            ),
          ),
          SizedBox(width: 3),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      eventTitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 270,
                      child: Text(
                        eventDescription.toString(),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      DateFormat.yMMMd('en_US').format(
                        DateTime.parse(eventStartDate.toString()),
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      '  -  ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd('en_US').format(
                        DateTime.parse(eventEndDate.toString()),
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 14.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      city.toString() + ", " + country.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
