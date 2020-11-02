import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/learn/ex01.dart';
import 'package:smart_gloves_demonstration_app/learn/ex02.dart';
import 'package:smart_gloves_demonstration_app/learn/ex03.dart';
import 'package:smart_gloves_demonstration_app/learn/ex04.dart';



class LearnPage extends StatefulWidget{
  @override
  _LearnPageState createState() => _LearnPageState();
}
String learn_name = "Learning Modules ";
String login_username = "";
Widget _learn_screen_appbar(){
  return  AppBar(
      title: Text(learn_name,style: TextStyle( color: Colors.white),),
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


class _LearnPageState extends State<LearnPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _learn_screen_appbar(),
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
                  child:FlatButton(
                    color: Colors.grey[850],
                    textColor: Colors.white,
                    onPressed: ()
                    { Navigator.push(context, MaterialPageRoute(builder: (context) => Ex01())); },
                    child: Text('Preparing for Practice',
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
                    onPressed: ()
                    {Navigator.push(context, MaterialPageRoute(builder: (context) => Ex02())); },
                    child: Text('Interrupted Stitch',
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
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Ex03())); },
                    child: Text('Continuous Stitch',
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
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Ex04())); },
                    child: Text('Knot Tying',
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







