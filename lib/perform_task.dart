import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:smart_gloves_demonstration_app/utils/video_helper.dart';

//CLass for performing task
class PerformTask extends StatefulWidget {
  PerformTask() : super();

  final String title = "Exercise 01";

  @override
  PerformTaskState createState() => PerformTaskState();
}

class PerformTaskState extends State<PerformTask> {
  File videoFile;


  _video_record()async{
    File theVid = await ImagePicker.pickVideo(
        source: ImageSource.camera);
    if(theVid !=null){
      setState(() {
        videoFile = theVid;
      });
    }
  }
  _video_delete(){

    if(videoFile != null){
      setState(() {
        videoFile=null;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {Navigator.pop(context);
            }
        ),

        title: Text("Preparing for Practice"),
        backgroundColor: Colors.teal[100],
        elevation: 0,

      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*(40/100),
                width: MediaQuery.of(context).size.width*(100/100),
                child: videoFile == null?Center(
                  child: Icon(Icons.videocam, color: Colors.black,size: 50),
                ):FittedBox(
                  fit: BoxFit.contain,
                  child: mounted?Chewie(
                    controller: ChewieController(
                      videoPlayerController: new VideoPlayerController.file(videoFile),
                      aspectRatio: 3/2,
                      autoPlay: true,
                      looping: true,
                    ),
                  ):Container(),
                ),
              ),
              RaisedButton(

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("BEGIN TASK"),
                    Icon(Icons.play_circle_filled)
                  ],
                ),
                onPressed: (){
                  _video_record();
                },
              ),
              RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("RETRY"),
                    Icon(Icons.redo)
                  ],
                ),
                onPressed: (){
                  _video_delete();
                },
              )
              //YoutubePlayer(controller: _controller,
              // ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
  }

}