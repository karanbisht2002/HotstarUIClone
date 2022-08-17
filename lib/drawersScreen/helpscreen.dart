import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            'Help'
        ),
      ),
      body: Center(
        child: Text(
          'This is Help Page UnderProgress',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}