import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controler/moviecontroler.dart';
import '../controler/moviecontrolercomedy.dart';
import '../controler/moviecontrolertrending.dart';

class ChannelScreen extends StatelessWidget
{
  var baseurl = 'https://image.tmdb.org/t/p/original';
  final Moviecontroller moviecontroller=Get.put(Moviecontroller());
  final MovieControlerComedy movieControlerComedy=Get.put(MovieControlerComedy());
  final MovieControlerTrending movieControlerTrending=Get.put(MovieControlerTrending());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Channel'),
        actions: [
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: GridView.builder(

        itemCount: movieControlerTrending.fetchdatatr.value!.results!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
             // color: Colors.indigo
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: baseurl+movieControlerTrending.fetchdatatr.value!.results![index].backdropPath.toString(),
                
                fit: BoxFit.cover,

              ),
            ),
          );

        },
      ),

    );
  }

}