import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/perform_task.dart';
import "package:smart_gloves_demonstration_app/practicequiz/ui/pages/home.dart";

class PracticePage extends StatefulWidget{
  @override
  _PracticePageState createState() => _PracticePageState();
}
String practice_name = "Practice Modules ";
String login_username = "";
Widget _practice_screen_appbar(){
  return  AppBar(
      title: Text(practice_name,style: TextStyle(
          color: Colors.white),),
      backgroundColor: Colors.teal[100],
      actions:  const <Widget>[
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        )
      ],
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
class _PracticePageState extends State<PracticePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _practice_screen_appbar(),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PerformTask()));
                    },
                    child: Text('Continuous Stitch',
                        style: TextStyle(
                        fontSize: 20.0,
                    )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child:FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PerformTask()));
                    },
                    child: Text('Interrupted Stitch',

                        style: TextStyle(
                          fontSize: 20.0,

                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child:FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PerformTask()));
                    },
                    child: Text('Knot Tying',
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child:FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: ()
                    { Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); }, // connects to the homepage of practice quiz //
                    child: Text('Practice Quiz',
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                  ),
                )
              ],
            )

          ],
        ),

      ),
    );
  }

}