import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/bottomsheets.dart';


class MovieDesign extends StatelessWidget {

  MovieDesign(
      {
        Key?key,
        required   this.imageurl,
        required   this.baseurl,
        required this.index1,
        //  required this.listresponse,
        required this.title,
        required   this.relasedate,
        required this.overview,
        required this.rating,

      });
  dynamic?imageurl;
  dynamic?baseurl;
  dynamic?index1;
  //dynamic?listresponse;
  dynamic?title;
  dynamic?relasedate;
  dynamic?overview;
  dynamic?rating;
  @override
  Widget build(BuildContext context) {
    return

      Stack(
          children:[

            InkWell(
              onTap: ()
              {

                // Get.toNamed('/bottomsheet',arguments: [
                //   imageurl,
                //   relasedate,
                //   title,
                //   index1,
                //   baseurl,
                //   overview,
                //   rating
                // ]);
                showModalBottomSheet(
                    backgroundColor: Colors.black,
                    context: context,
                    builder: (BuildContext context) {
                      return   Bottomsheet(imageurl: imageurl ?? "", releasedate: relasedate ?? "", title: title ?? "", index: index1, baseurl: baseurl ?? "", overview: overview ?? "", rating: rating ?? "",);
                    });
              },
              child: Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.01
                  ),
                  width: MediaQuery.of(context).size.width*0.30,
                  height: MediaQuery.of(context).size.height*0.40,

                  //color: Colors.green,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: baseurl+'${imageurl}',
                      fit: BoxFit.cover,
                      //height: MediaQuery.of(context).size.height*0.02,
                    ),
                  )
              ),
            ),
          ]
      );

  }
}
