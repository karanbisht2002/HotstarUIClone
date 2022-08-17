import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            'Downloads'
        ),
      ),
      body: Center(
        child: Text(
          'You Have Not Downloaded AnyThing',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}