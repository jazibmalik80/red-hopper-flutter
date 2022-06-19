// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/view_models/upcomming_event_viewmodel.dart';

class FeedCard extends StatelessWidget {
  final String eventTitle;

  const FeedCard({
    required this.eventTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image(
              image: AssetImage(
                'assets/event.jpg',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      eventTitle,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Ut quis ut qui earum at quos accusantium officia. Quo repellat enim voluptas quis totam et. Qui itaque natus assumenda.',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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
