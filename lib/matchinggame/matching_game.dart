
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MatchingGame extends StatefulWidget {
  @override
  _MatchingGameState createState() => _MatchingGameState();
}


class _MatchingGameState extends State<MatchingGame> {

  List<ItemModel> items;                                                        // Listing items //
  List<ItemModel>items2;                                                        // Listing items //

  int score;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame(){
    gameOver = false;
    score=0;
    items=[
      ItemModel(icon:FontAwesomeIcons.glasses,name:"Glasses", value:"Glasses"),
      ItemModel(icon:FontAwesomeIcons.cut,name:"Scissors", value:"Scissors"),
      ItemModel(icon:FontAwesomeIcons.handsWash,name:"Hand Wash", value:"Hand Wash"),
      ItemModel(icon:FontAwesomeIcons.hospital,name:"Hospital", value: "Hospital"),
      ItemModel(icon:FontAwesomeIcons.medkit,name:"Med Kit", value:"Med Kit"),  // Creating item widgets using Font awesomeIcons //
      ItemModel(icon:FontAwesomeIcons.handPaper,name:"Glove", value:"Glove"),
      ItemModel(icon:FontAwesomeIcons.headSideMask,name:"Face Mask", value:"Face Mask"),
      ItemModel(icon:FontAwesomeIcons.userNurse,name:"Surgeon", value:"Surgeon"),




    ];
    items2 = List<ItemModel>.from(items);                                       // Shuffle iteration //
    items.shuffle();
    items2.shuffle();
  }


  @override
  Widget build(BuildContext context) {
    if(items.length == 0)
      gameOver = true;
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        centerTitle: true,
        title: Text('Matching Game'),


      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: "Score: "),
                  TextSpan(text: "$score", style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
                ]
            )
            ),
            if(!gameOver)                                                       // Checking argument //
              Row(
                children: <Widget>[
                  Column(
                      children: items.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Draggable<ItemModel>(                          // Calling draggable child widget to drag items //
                            data: item,
                            childWhenDragging: Icon(
                              item.icon, color: Colors.grey,size: 50.0,),
                            feedback: Icon(item.icon,color: Colors.teal,size: 50,),
                            child: Icon(item.icon, color: Colors.teal, size:50,),
                          ),
                        );


                      }).toList()
                  ),
                  Spacer(

                  ),
                  Column(
                      children: items2.map((item){
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem){
                            if(item.value== receivedItem.value){                // If value matches with corresponding selection //
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                                score+=10;
                                item.accepting =false;
                              });

                            }else{
                              setState(() {
                                score-=5;
                                item.accepting =false;                          // If value does'nt match with corresponding selection //

                              });
                            }
                          },
                          onLeave: (receivedItem){
                            setState(() {
                              item.accepting=false;
                            });
                          },
                          onWillAccept: (receivedItem){
                            setState(() {
                              item.accepting=true;
                            });
                            return true;
                          },
                          builder: (context, acceptedItems,rejectedItem) => Container(
                            color: item.accepting? Colors.red:Colors.teal,
                            height: 50,
                            width: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(8.0),
                            child: Text(item.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                fontSize: 18.0),),
                          ),


                        );

                      }).toList()

                  ),
                ],
              ),
            if(gameOver)                                                        // Checking argument //
              Text("GameOver", style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),),
            if(gameOver)
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: Text("New Game"),
                  onPressed: ()                                                 // Return value //
                  {
                    initGame();
                    setState(() {

                    });
                  },
                ),
              )

          ],
        ),

      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;




  ItemModel({this.name, this.value, this.icon, this.accepting= false});}