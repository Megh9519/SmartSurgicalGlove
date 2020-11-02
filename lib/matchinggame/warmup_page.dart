//import 'dart:html';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/matchinggame/matching_game.dart';
import 'package:smart_gloves_demonstration_app/memorygame/memory_game.dart';

import '../warmup/acceltest_page.dart';
import '../warmup/hold_steady_instructions.dart';

class WarmUpPage extends StatefulWidget{
  @override
  _WarmUpPageState createState() => _WarmUpPageState();
}
String warmup_name = "Warm Up ";
String login_username = "";
Widget _warmup_screen_appbar(){
  return  AppBar(
      title: Text(warmup_name,style: TextStyle( color: Colors.white),),
      backgroundColor: Colors.teal[100],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
            color: Colors.black12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  login_username,
                  style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
        ),
      )
  );
}

class _WarmUpPageState extends State<WarmUpPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _warmup_screen_appbar(),
      body: Container(
        color: Colors.grey[850],
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HoldSteadyInstructions()));
                    },
                    child: Text('Hold Steady',
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MatchingGame()));
                    },
                    child: Text('Matching Game',
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MemoryGame()));
                    },
                    child: Text('Memory Game',
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccelTest()));
                    },
                    child: Text('Accelerometer Demo',
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}