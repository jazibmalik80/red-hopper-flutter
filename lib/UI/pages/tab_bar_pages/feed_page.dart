// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redhopper_app/UI/widgets/feed_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Flexible(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return FeedCard(
              eventTitle: 'Human Rights Conference',
            );
          },
        ),
      ),
    );
  }
}
