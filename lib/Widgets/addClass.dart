import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddClass extends StatelessWidget
{
  dynamic?myimageurl;

  AddClass(
      this.myimageurl,

      );
  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: myimageurl.toString(),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      fit: BoxFit.cover,

    );
  }

}