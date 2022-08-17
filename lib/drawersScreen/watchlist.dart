import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchLaterList extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            'WatchLaterLists'
        ),
      ),
      body: Center(
        child: Text(
          'You Have Not Any WacthLaterList',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}