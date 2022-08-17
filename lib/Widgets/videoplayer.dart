import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'VideoPlayerWidget.dart';

class VideoPlayer extends StatefulWidget
{
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController=VideoPlayerController.asset('assets/video/sample2.mp4')
    ..addListener(()=>setState((){}))
    ..setLooping(true)
    ..initialize().then((value) => videoPlayerController.play());
  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   final ismute=videoPlayerController.value.volume==0;
  // final isplay=videoPlayerController.value.
    return Stack(
      children: [
        VideoPlayerWidget(
        controller:videoPlayerController),
      if(videoPlayerController!=null&& videoPlayerController.value.isInitialized)
        Positioned(
          top: 217,
          left: 339,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,
            child: IconButton(
              icon:Icon(
              ismute?Icons.volume_mute:Icons.volume_up,
              size: 20,
              color: Colors.white),
            onPressed: ()=>videoPlayerController.setVolume(ismute?1:0),
            ),
          ),
        ),

      ]
   );
  }
}