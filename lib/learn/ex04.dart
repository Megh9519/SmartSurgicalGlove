
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';




class Ex04 extends StatefulWidget {
  @override
  _Ex04State createState() => _Ex04State();
}

class _Ex04State extends State<Ex04> {
  //The video link to source from
  String videoURL = "https://www.youtube.com/watch?v=pTkqFXhLA8M";

  //intialising the player controller`
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
        title: Text("Knot Tying"),
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