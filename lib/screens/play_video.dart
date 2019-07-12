import 'package:flutter/material.dart';
import 'package:jacky_tpa/model/jacky_video_model.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  final JackyVideoModel jackyVideoModel;
  PlayVideo({Key key, this.jackyVideoModel}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
// Explicit
  JackyVideoModel jackyVideoModel;

  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  String urlVideo;

// Method
  @override
  void initState() {
    super.initState();
    setState(() {
      jackyVideoModel = widget.jackyVideoModel;
      urlVideo = jackyVideoModel.pathVideo;

      videoPlayerController = VideoPlayerController.network(urlVideo);
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 3 / 2,
          autoPlay: true,looping: false);
    });
    jackyVideoModel = widget.jackyVideoModel;
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Video ${jackyVideoModel.name}'),
      ),
      body: Center(child: Chewie(controller: chewieController,),),
    );
  }
}
