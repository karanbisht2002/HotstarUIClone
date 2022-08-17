import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Texttitle extends StatelessWidget
{
    dynamic title;
  Texttitle(
    {
      Key?key, required  this.title,
    });
  @override
  Widget build(BuildContext context) {

       return Container(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Padding(
               padding:
               EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
               child: Text(
                 title,
                 style: TextStyle(color: Colors.white, fontSize: 18),
               ),
             ),
             Padding(
               padding: EdgeInsets.only(
                 right: MediaQuery.of(context).size.width * 0.03,
               ),
               child: Icon(
                 Icons.arrow_forward_ios,
                 color: Colors.white70,
                 size: 18,
               ),
             )
           ],
         ),
       );
     }
  }

