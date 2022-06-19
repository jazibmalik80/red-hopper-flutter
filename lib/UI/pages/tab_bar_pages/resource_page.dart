// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, 0, 16),
        child: Column(
          children: const [
            ListTile(
              title: Text('Resource Tile One'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Resource Tile Two'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              title: Text('Resource Tile Three'),
              subtitle: Text(
                'Dolor ad dolores voluptatibus voluptates esse.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
