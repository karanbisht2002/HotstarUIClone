import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/moviedesign.dart';

class SeeMoreScreen extends StatelessWidget
{

  dynamic?imageurl;
  dynamic?baseurl;
  dynamic?titleapp;
 // dynamic?index1;
  //dynamic?listresponse;
  dynamic?title;
  dynamic?relasedate;
  dynamic?overview;
  dynamic?rating;
  dynamic?length;

  SeeMoreScreen({
    required this.titleapp,
    required this.length,
    required   this.imageurl,
    required   this.baseurl,
    //required this.index1,
    //  required this.listresponse,
    required this.title,
    required   this.relasedate,
    required this.overview,
    required this.rating,

  });
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar:AppBar(
          title: Text(titleapp,style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          // margin: EdgeInsets.symmetric(
          //   vertical: MediaQuery.of(context).size.height*0.02,
          //
          // ),
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,

          child: GridView.builder(

            reverse: true,
            //scrollDirection: Axis.vertical,
            itemCount: length,
            itemBuilder: (BuildContext context, int index) {

              return  MovieDesign(
                baseurl: baseurl,
                imageurl: imageurl.results[index].backdropPath,
                overview: overview.results[index].overview,
                index1: index,
                rating: rating.results[index].voteAverage,
                relasedate: relasedate.results[index].releaseDate,
                title: title.results[index].title,
              );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
            // crossAxisSpacing: 0,
            // mainAxisSpacing:0

          ),

          ),
        ),
      );
  }
}