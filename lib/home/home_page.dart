import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/login/login_page.dart';
import 'package:smart_gloves_demonstration_app/models/personal_detail.dart';
import 'package:smart_gloves_demonstration_app/warmup/warmup_page.dart';
import 'package:smart_gloves_demonstration_app/learn/learn_page.dart';
import 'package:smart_gloves_demonstration_app/challenge/challenge_page.dart';
import 'package:smart_gloves_demonstration_app/practice/practice_page.dart';
import 'package:smart_gloves_demonstration_app/progress/progress_page.dart';
import 'package:smart_gloves_demonstration_app/setting/setting_page.dart';

class HomePage extends StatefulWidget{
  final PersonalInfo newUser;
  HomePage({this.newUser});

  @override
  _HomePageState createState() => _HomePageState();
}




String home_name = "Home Page";
String login_username = "Test user";
var options = ["assets/learn_icon.png","assets/practice_icon.png","assets/challenge.png",
  "assets/warmup_icon.png","assets/settings.png","assets/progress_icon.png"];
var options_name = ["LEARN","PRACTICE","CHALLENGE","WARM-UP","SETTINGS","PROGRESS"];

Widget _home_screen_appbar(){
  return  AppBar(
      title: Text(home_name,style: TextStyle( color: Colors.white),),
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
                Text(newUser == null ? login_username : "Hello " + newUser.fname + " " +newUser.lname + "!" ,
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
void _navigate_to_specified_function(int x, BuildContext context){
  switch(x){
    case 0: {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LearnPage()));
      break;
    }
    case 1:{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PracticePage()));
      break;
      }
    case 2:{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChallengePage()));
      break;
    }
    case 3:{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WarmUpPage()));
      break;
    }
    case 4:{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SettingPage()));
      break;
    }
    case 5:{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProgressPage()));
      break;
    }
  }
}
Widget _gridview_of_function(BuildContext context){
  return GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 30,
    mainAxisSpacing: 20,
    crossAxisCount: 2,
    shrinkWrap: true,
    children: <Widget>[
      for(int i = 0 ; i < options.length ; i++)
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              shape: CircleBorder(),
              onPressed: (){
                _navigate_to_specified_function(i,context);
              },
              child: Image(
                image: AssetImage(options[i].toString()),
                width: 120,
                height: 120,
              ),
              color: Colors.black12,
            ),

            Text(
              options_name[i].toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          ],

        )


    ],
  );
}
class _HomePageState extends State<HomePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: _home_screen_appbar(),
      body: Container(
          color: Colors.white10,
          child: _gridview_of_function(context)
          ),
      );
  }

}