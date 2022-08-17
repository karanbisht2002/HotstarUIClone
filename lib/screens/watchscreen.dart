import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hotstarui/Widgets/moviedesign.dart';
import 'package:hotstarui/controler/moviecontrolercomedy.dart';

import '../Widgets/texttitle.dart';
import '../Widgets/videoplayer.dart';

class WatchScreen extends StatelessWidget
{
  dynamic?imageurl;
  dynamic?baseurl;
  dynamic?title;
  dynamic?rating;
  dynamic?relasedate;
  dynamic?context2;
  dynamic?description;

  final MovieControlerComedy movieControlerComedy=Get.put(MovieControlerComedy());
  WatchScreen(
      {
        required this.imageurl,
        required this.baseurl,
        required this.title,
        required this.rating,
        required this.relasedate,
        required this.context2,
        required this.description,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.30,
              //color: Colors.green,
              child:VideoPlayer(),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),

            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.03,
                  left: MediaQuery.of(context).size.width*0.03,
                  bottom: MediaQuery.of(context).size.height*0.02
              ),
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.15,
              //color: Colors.green,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.23,
                    height: MediaQuery.of(context).size.height*0.35,
                    //color: Colors.greenAccent,
                    child: CachedNetworkImage(
                      imageUrl:baseurl+'${imageurl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*0.03
                        ),
                        width: MediaQuery.of(context).size.width*0.7,
                        height: MediaQuery.of(context).size.height*0.03,
                        //color: Colors.indigo,
                        child: Text(
                          title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(

                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.03,
                          top: MediaQuery.of(context).size.height*0.01,
                        ),
                        width: MediaQuery.of(context).size.width*0.7,
                        height: MediaQuery.of(context).size.height*0.03,
                        //color: Colors.indigo,
                        child: Text(
                          'Rating:- '+rating.toString(),
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white70
                          ),
                        ),
                      ),
                      Container(

                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.03,
                          top: MediaQuery.of(context).size.height*0.01,
                        ),
                        width: MediaQuery.of(context).size.width*0.7,
                        height: MediaQuery.of(context).size.height*0.03,
                        //color: Colors.indigo,
                        child: Text(
                          'Release Date:- '+relasedate.toString(),
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white70
                          ),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
               Container(
                 width: MediaQuery.of(context).size.width*1,
                 margin: EdgeInsets.only(
                   left: MediaQuery.of(context).size.width*0.02
                 ),
                 child: Text(
                   'OverView of the Movie',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30,
                     fontWeight: FontWeight.bold
                   ),
                 ),
               ),
               Divider(
                 thickness: 1,
                 color: Colors.white,
               ),
               Container(
                 padding: EdgeInsets.only(
                   left: MediaQuery.of(context).size.width*0.03,
                   top: MediaQuery.of(context).size.height*0.01
                 ),
                 child: Text(

                   description,
                   //maxLines: 7,
                   style: TextStyle(
                     color: Colors.white70,
                     fontSize: 20,
                   ),
                 ),
               ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.05,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.09
              ),
              color: Colors.indigo,
              child: Text(

                'Watch Full Movie',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
           ],
        ),
      ),
    ) ;
  }

}