// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redhopper_app/core/models/event_model.dart';

class EventDetailUpperBody extends StatefulWidget {
  final EventData eventData;
  const EventDetailUpperBody({Key? key, required this.eventData})
      : super(key: key);

  @override
  _EventDetailUpperBodyState createState() => _EventDetailUpperBodyState();
}

class _EventDetailUpperBodyState extends State<EventDetailUpperBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://picsum.photos/50",
                ),
              ),
              SizedBox(width: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://picsum.photos/50",
                ),
              ),
              SizedBox(width: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://picsum.photos/50",
                ),
              ),
              SizedBox(width: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://picsum.photos/50",
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          DateTime.parse(
                            widget.eventData.startDate.toString(),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '  -  ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd('en_US').format(
                          DateTime.parse(
                            widget.eventData.endDate.toString(),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
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
                        widget.eventData.venue.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  CupertinoButton(
                    minSize: 36,
                    onPressed: () {},
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    color: CupertinoColors.activeBlue,
                    padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                widget.eventData.title.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(1.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.eventData.description.toString(),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
