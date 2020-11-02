import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hold_steady_game.dart';

class HoldSteadyInstructions extends StatefulWidget {
  @override
  _HoldSteadyInstructionsState createState() => _HoldSteadyInstructionsState();
}

class _HoldSteadyInstructionsState extends State<HoldSteadyInstructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Hold Steady Instructions'),
      ),
      body:Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(30), child: Container(
            child: Text('Hold Your hand steady! Place your phone flat on your palm and try to keep still. Click start below once you have read these Intructions.  This game tests to see how steady your are. Have you had too much coffee? Got the shakes ? Only time will tell.',style: TextStyle(fontSize: 22),),
          ),),
          Padding(padding: EdgeInsets.all(50), child: Container(
            child: MaterialButton(
              child: Text('Go to game'),
              elevation: 1,
              color: Colors.blueGrey,
              textColor: Colors.white,
              height: 40,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HoldSteadyGame()));
              },
            )
          ),)
        ],
      )
    );
  }
}
