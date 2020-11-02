import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chewie/chewie.dart';
import 'package:smart_gloves_demonstration_app/learn/ex01.dart';
import 'package:video_player/video_player.dart';
import 'package:smart_gloves_demonstration_app/utils/video_helper.dart';

//CLass for Exercise 01 learning module
class Exercise01 extends StatefulWidget {
  Exercise01() : super();

  final String title = "Exercise 01";

  @override
  Exercise01State createState() => Exercise01State();
}

class Exercise01State extends State<Exercise01> {
  File videoFile;

  _video_selection()async{
    File theVid = await ImagePicker.pickVideo(
        source: ImageSource.gallery);
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
      backgroundColor: Colors.grey[850],
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
                  child: Icon(Icons.videocam, color: Colors.teal,size: 80),
                ):FittedBox(
                  fit: BoxFit.contain,
                  child: mounted?Chewie(
                    controller: ChewieController(
                      videoPlayerController: VideoPlayerController.file(videoFile),
                      aspectRatio: 3/2,
                      autoPlay: true,
                      looping: true,
                    ),
                  ):Container(),
                ),
              ),
              RaisedButton(
                color: Colors.teal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("LEARN"),
                    Icon(Icons.video_library)
                  ],
                ),
                onPressed: (){
                  {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ex01())); } // connects to the Exercise 01 //
                },
              ),
              RaisedButton(
                color: Colors.teal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("GALLERY"),
                    Icon(Icons.video_library)
                  ],
                ),
                onPressed:  (){
                  _video_selection();
                },
              ),
              RaisedButton(
                color: Colors.teal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("DELETE"),
                    Icon(Icons.delete)
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
}