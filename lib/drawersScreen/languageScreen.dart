import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controler/moviecontroler.dart';
import '../controler/moviecontrolercomedy.dart';
import '../controler/moviecontrolertrending.dart';

class LanguageScreen extends StatelessWidget
{

  var language=[
    'Hindi',
    'English',
    'Telugu',
    'Bengali',
    'Malayalam',
    'Marathi',
    'Kanadka',
    ' Urdu',
    'Nepali',
    'Punjabi',
    'Kashmiri',
    'Gujarati',
    'Konkani'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Language'),
        actions: [
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: GridView.builder(

        itemCount: language.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
               margin: EdgeInsets.only(
                 left: MediaQuery.of(context).size.height*0.01,
                 top: MediaQuery.of(context).size.width*0.02,
                 right:  MediaQuery.of(context).size.width*0.01,

               ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Colors.greenAccent,
                  Colors.blue,
                ]
              )
            ),
            child: Text(
              language[index],
             textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),

            )
          );
          },
      ),
    );
  }
}