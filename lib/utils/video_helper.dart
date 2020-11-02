import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

//CLass for video helper in learning module
class VideoHelper{
  Future<File> _video_selection(File myVideo)async {
    File theVid = await ImagePicker.pickVideo(
        source: ImageSource.gallery);
    if (theVid != null) {
      myVideo = theVid;
    }
    return myVideo;
  }

  File _video_delete(File videoFile){
    if(videoFile != null){
      videoFile = null;
    }
    return videoFile;
  }
}
