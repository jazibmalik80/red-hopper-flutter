// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redhopper_app/UI/widgets/review_card.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 16),
      child: Flexible(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ReviewCard();
          },
        ),
      ),
    );
  }
}
