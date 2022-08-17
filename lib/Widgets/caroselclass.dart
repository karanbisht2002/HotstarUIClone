import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstarui/Widgets/addClass.dart';

class Caroselclass extends StatelessWidget {

  dynamic?listresponse;
  dynamic?baseurl;

  Caroselclass(
      this.listresponse,
      this.baseurl,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery
            .of(context)
            .size
            .height * 0.02,
        horizontal: MediaQuery
            .of(context)
            .size
            .width * 0.02,
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 1,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.18,
      child: CarouselSlider.builder(
        itemCount: listresponse.length,
        itemBuilder: (BuildContext context, int index, _) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: baseurl + '${listresponse[index]['backdrop_path']}',
              fit: BoxFit.fitWidth,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1,
            ),
          );
        },
        options: CarouselOptions(
            autoPlayCurve: Curves.fastOutSlowIn,
            // pageSnapping:false,// we can stop between two images
            enableInfiniteScroll: false,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true
          //autoPlayInterval: Duration(seconds: 1)
        ),
      ),
    );
  }
}
