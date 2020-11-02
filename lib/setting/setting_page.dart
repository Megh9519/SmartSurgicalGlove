import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/megh9/AndroidStudioProjects/Smart-Gloves-Demonstration-App/lib/login/login_page.dart';


class SettingPage extends StatefulWidget{
  @override
  _SettingPageState createState() => _SettingPageState();
}
String setting_name = "Settings";
String login_username = "";
Widget _setting_screen_appbar(){
  return  AppBar(
      title: Text(setting_name,style: TextStyle( color: Colors.white),),
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


class _SettingPageState extends State<SettingPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _setting_screen_appbar(),
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

                     onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SearchSensors())); },
                     child: Text('Search and Pair Sensors',
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
                     onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TestSensors())); },
                     child: Text('Test Sensors',
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
                     onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DiagnosticInfo())); },
                     child: Text('Diagnostic Information',
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
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackSup())); },
                    child: Text('Feedback and Support',
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
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Credits())); },
                    child: Text('Credits',
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
                     onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())); },
                     child: Text('Login Page',
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

// Class Test Sensor
class TestSensors extends StatefulWidget {
  @override
  _TestSensorsState createState() => _TestSensorsState();
}

class _TestSensorsState extends State<TestSensors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        leading:
        IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }
        ),

        title: Text('Test Sensors'),
        backgroundColor: Colors.teal[100],
        elevation: 0,
      ),
    );
  }
}
//Class Search sensor

class SearchSensors extends StatefulWidget {
  @override
  _SearchSensorsState createState() => _SearchSensorsState();
}

class _SearchSensorsState extends State<SearchSensors> {
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
          title: Text('Search and Pair Sensors'),
          backgroundColor: Colors.teal[100],
          elevation: 0,
        ),
        body:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Enter Sensor ID',
                style:TextStyle(
                    color: Colors.white,
                    fontSize: 16
                )),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  contentPadding: EdgeInsets.only(top: 14),

                ),
              ),
            ),
          ],
        )


    );
  }
}


//class Feedback support
class FeedbackSup extends StatelessWidget {
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

        title: Text('Feedback and Support'),
        backgroundColor: Colors.teal[100],
        elevation: 0,
      ),
    );
  }
}

//Class credits
class Credits extends StatelessWidget {
  String creditsText = 'Smart Gloves Demonstration App (Prototype) \nDeveloped by: Jack Kennedy-Salter, Megh Parmar, MD Nabin and Sandra Tsang.';
  String acknowledgement ='Medical vector created by freepik - www.freepik.com/vectors/medical Challenge warm-up, practice and progress icons made by https://www.flaticon.com/authors/freepik Settings Icon made by https://www.flaticon.com/authors/dinosoftlabs';
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

        title: Text('Credits'),

        backgroundColor: Colors.teal[100],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('$creditsText',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Acknowledgements:\n$acknowledgement',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                )),
          )

        ],
      ),
    );
  }
}

//class dialog info
class DiagnosticInfo extends StatelessWidget {
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

        title: Text('Diagnostic Info'),
        backgroundColor: Colors.teal[100],
        elevation: 0,
      ),
    );
  }
}
