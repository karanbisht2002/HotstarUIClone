import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Prizes extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            'Prizes'
        ),
      ),
      body: Center(
        child: Text(
          'You Have Not Won Any Prizes',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}