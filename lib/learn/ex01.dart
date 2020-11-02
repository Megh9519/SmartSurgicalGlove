
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';




class Ex01 extends StatefulWidget {
  @override
  _Ex01State createState() => _Ex01State();
}

class _Ex01State extends State<Ex01> {
  //The video link to source from
  String videoURL = "https://www.youtube.com/watch?v=WpZqLbWL0c0";
//intialising the player controller
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL) //passing the url to the video player controller
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Preparing for practice"),
        backgroundColor: Colors.teal[100],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),

            ],
          ),
        ),
      ),
    );
  }
}