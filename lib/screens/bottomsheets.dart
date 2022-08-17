import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotstarui/screens/watchscreen.dart';

import '../controler/moviecontroler.dart';

class Bottomsheet extends StatelessWidget
{

  final Moviecontroller moviecontroller=Get.put(Moviecontroller());

  dynamic?baseurl;
  dynamic?imageurl;
  dynamic?index;
  dynamic?title;
  dynamic?releasedate;
  dynamic?rating;
  dynamic?overview;
  Bottomsheet(

      {     Key?key,
        required this.baseurl,
        required this.imageurl,
        required this.index,
        required this.title,
        required this.releasedate,
        required this.rating,
        required this.overview,
      }
      );
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
            children:[
              Container(
                height: MediaQuery.of(context).size.height*0.30,
                //color: Colors.green,
                child: CachedNetworkImage(
                  imageUrl: baseurl+'${imageurl.toString()}',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*1,
                //color: Colors.green,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.27,
                  //left: MediaQuery.of(context).size.width*0.25,
                ),
                child: Text(
                  title,
                  maxLines:1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontStyle:FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ]
        ),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height*0.01,
          ),
          //color: Colors.green,
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.03,
          child: Text(
            'Release Date-'+releasedate.toString().replaceAll('00:00:00.000',"")+'||'+' Rating - '+rating.toString().toUpperCase()+'/10',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white70
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height*0.01,
          ),

          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.06,
          //color:Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Column(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    'Watchlist',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: ()
                {
                  Get.to(WatchScreen(imageurl: imageurl, baseurl: baseurl, title: title??"", rating: rating, relasedate: releasedate, context2: context, description: overview,));
                },
                child: Container(
                  //alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.indigo,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Watch',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    'Info',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ],
              ),

            ],
          ),

        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height*0.03,
            left: MediaQuery.of(context).size.width*0.03,
            right: MediaQuery.of(context).size.width*0.03,
          ),
          child: Text(
            overview.toString(),
            textAlign: TextAlign.justify,
            maxLines: 5,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              //fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}