import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChannelLogoDesign extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
           width: MediaQuery.of(context).size.width*1,
           height: MediaQuery.of(context).size.height*0.09,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height*0.02
        ),
        decoration: BoxDecoration(
         // color: Colors.blue,
        ),
           child:Row(
             children: [
               channeldesign(context,"assets/images/disney.png"),
               channeldesign(context,"assets/images/pixar.png"),
               channeldesign(context,"assets/images/marvel.png"),
               channeldesign(context,"assets/images/starwar.png"),
               channeldesign(context,"assets/images/national.png"),
             ],
           )
       );
  }
  Widget channeldesign(BuildContext context,var imageurl)
  {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
            colors: <Color>[
              Colors.indigo,
              Colors.blue,
            ]
        ),
        borderRadius: BorderRadius.circular(13)
      ),
      height: MediaQuery.of(context).size.height*0.08,
      width: MediaQuery.of(context).size.width*0.18,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width*0.01
      ),
      child: Image.asset(imageurl),

    );
  }

  }

