
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget
{
  final VideoPlayerController controller;
  VideoPlayerWidget(
  {required this.controller}
      );
  @override
  Widget build(BuildContext context) {

     return controller!=null && controller.value.isInitialized?Container(
     alignment: Alignment.topCenter,
     child: GestureDetector(
       behavior: HitTestBehavior.opaque,
       onTap: ()=>controller.value.isPlaying?controller.pause():controller.play(),
       child: Stack(
         children:[
           Container(
             margin: EdgeInsets.only(
               left: MediaQuery.of(context).size.width*0.07
             ),
             child: AspectRatio(
             aspectRatio: controller.value.aspectRatio,
             child: VideoPlayer(controller)
             ),
           ),
          controller.value.isPlaying?Container():
            Container(
            alignment: Alignment.center,
            color: Colors.black38,
            child: Icon(
          Icons.play_arrow,color: Colors.white,size: 80,
            )
          ),
    Positioned.fill(top: 245,left:20,right:40,child: VideoProgressIndicator(controller, allowScrubbing:true ),
    )
           // Positioned.fill(
           //     child:controller.value.isPlaying?Container():
           //     GestureDetector(
           //       behavior: HitTestBehavior.opaque,
           //       onTap: ()=>controller.value.isPlaying?controller.pause()
           //           :controller.play(),
           //       child: Container(
           //         alignment: Alignment.center,
           //         color: Colors.black38,
           //         child: Icon(
           //           Icons.play_arrow,
           //           color: Colors.white,
           //           size: 80,
           //         ),
           //       ),
           //     )
           // ),

         ]
       ),
     ),
       ):Container(
       height: 200,
       child: Center(

         child: CircularProgressIndicator(),
       ),
     );
  }

}