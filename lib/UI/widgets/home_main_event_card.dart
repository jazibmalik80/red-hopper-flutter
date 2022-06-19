// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeMainEventCard extends StatelessWidget {
  final String eventName;
  final String eventDescription;
  final String eventStartDate;
  final String eventEndDate;
  final String eventLocation;
  final String eventStatus;
  const HomeMainEventCard({
    required this.eventName,
    required this.eventDescription,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventLocation,
    required this.eventStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 14, 14, 4),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image(
                image: AssetImage(
                  'assets/event.jpg',
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(eventName),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    eventDescription,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  DateFormat.yMMMd('en_US').format(
                    DateTime.parse(eventStartDate),
                  ),
                ),
                SizedBox(width: 30),
                Icon(
                  Icons.calendar_today,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  DateFormat.yMMMd('en_US').format(
                    DateTime.parse(eventEndDate),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(eventLocation),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Chip(
                  label: Text(
                    eventStatus.toUpperCase(),
                    style: TextStyle(
                      color:
                          eventStatus == 'Active' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
