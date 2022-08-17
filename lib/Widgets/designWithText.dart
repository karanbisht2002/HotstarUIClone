import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class DesignWithText extends StatefulWidget
// {
//   @override
//   State<DesignWithText> createState() => _DesignWithTextState();
// }

class DesignWithText extends StatelessWidget {

  dynamic?imageurl;
  dynamic?title;
  dynamic?baseurl;
  DesignWithText(
      this.imageurl,
      this.title,
      this.baseurl,
      );

  @override
  Widget build(BuildContext context) {
     return Container(
       
       margin: EdgeInsets.symmetric(
           horizontal: MediaQuery.of(context).size.width*0.02
       ),
       width: MediaQuery.of(context).size.width* 0.46,
       height: MediaQuery.of(context).size.height*0.09,
       //color: Colors.green,
       child: Stack(
           children:[
             Opacity(
               opacity: 0.8,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(14),
                 child: CachedNetworkImage(
                   imageUrl:baseurl+imageurl,
                 height: MediaQuery.of(context).size.height*0.50,
                 width: MediaQuery.of(context).size.width*0.50,
                 fit: BoxFit.cover,

            // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),

           ),
               ),
             ),
             Positioned(
               top: MediaQuery.of(context).size.height*0.12,
               child: Row(
                 children: [
                   Icon(
                     Icons.play_arrow_rounded,
                     color: Colors.white,

                   ),
                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.45,
                     child: Text(
                       title,
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                       //textAlign: TextAlign.justify,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ]
       ),
     ) ;
     }
}