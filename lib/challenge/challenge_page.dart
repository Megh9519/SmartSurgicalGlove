import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_gloves_demonstration_app/utils/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:smart_gloves_demonstration_app/perform_task.dart';

class ChallengePage extends StatefulWidget{
  @override
  _ChallengePageState createState() => _ChallengePageState();
}
String challenge_name = "Challenges ";
String login_username = "Test user";
Widget _challenge_screen_appbar(){
  return  AppBar(
      title: Text(challenge_name,style: TextStyle( color: Colors.white),),
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
class _ChallengePageState extends State<ChallengePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _challenge_screen_appbar(),
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

                    },
                    child: Text('Weekly Challenges',
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
                    },
                    child: Text('Pick a challenge',
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
                    onPressed: () { //Navigator.push(context, MaterialPageRoute(builder: (context) => DiagnosticInfo()));
                    },
                    child: Text('Local Leaderboard',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Leaderboard()));
                    },
                    child: Text('Global Leaderboard',
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


class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();

}

class _LeaderboardState extends State<Leaderboard> {

  //http request to load global leaderboard from server
  String urlGetGLobalLeaderboard = "https://ps2025.cdms.westernsydney.edu.au/surgicalDB/getGlobalLeaderboard.php";
  //set the initial value of the drop down
  String ddValue = 'Continuous Stitch';
  //Variable holding the list of users in leaderboard
  List<dynamic> user_results = [];
  @override
  initState(){
   super.initState();
   this._get_global_leaderboard(ddValue);
  }




  //get current Date
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formattedDate = formatter.format(now);

  //SERVER SIDE SCRIPT for getting global leaderboard
  //POST RESPONCE
  _get_global_leaderboard(String challenge_name) async {
    var response = await http.post(urlGetGLobalLeaderboard, body: {"challenge_name": challenge_name});
    print("!!!!");
    print(response.body);
    var body = json.decode(response.body);
      setState(() {
        user_results = body['result'];
        print(user_results.length.toString());
      });

  }


  Widget _reload_leaderboard(BuildContext context){
    return  DataTable(
      columns: [
        DataColumn(
          label: Text('#'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
            label: Text('Score')
        ),
        DataColumn(
            label: Text('Time')
        )
      ],
      rows:   user_results // Loops through dataColumnText, each iteration assigning the value to element
          .map(
        ((element) => DataRow(
          cells: <DataCell>[
            DataCell(Text(element["position"])), //Extracting from Map element the value
            DataCell(Text(element["name"])),
            DataCell(Text(element["avg_score"])),
            DataCell(Text(element["time"])),
          ],
        )),
      )
          .toList(),

    );
  }
  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
          IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          title: Text('Leaderboard'),
          backgroundColor: Colors.teal[100],
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(formattedDate,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),),

                    DropdownButton<String>(
                      value: ddValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 22,
                      elevation: 16,
                      style: TextStyle(color: Colors.blueAccent),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          ddValue = newValue;
                          _get_global_leaderboard(ddValue);
                        });
                      },
                      items: <String>[
                        'Continuous Stitch',
                        'Interrupt Stitch',
                        'Knot Tying'
                      ]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                //default leaderboard
                _reload_leaderboard(context)
              ],
            )
          ],
        )
    );
  }

}

/*
*
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('1')
              ),
              DataCell(
                  Text('Megh')
              ),
              DataCell(
                  Text('36')
              ),
              DataCell(
                  Text('08.78')
              )
            ]
        ), DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('2')
              ),
              DataCell(
                  Text('MD')
              ),
              DataCell(
                  Text('33')
              ),
              DataCell(
                  Text('9.00')
              )
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('3')
              ),
              DataCell(
                  Text('Peter')
              ),
              DataCell(
                  Text('32')
              ),
              DataCell(
                  Text('09.33')
              )
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('4')
              ),
              DataCell(
                  Text('Sandra')
              ),
              DataCell(
                  Text('41')
              ),
              DataCell(
                  Text('09.55')
              )
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('5')
              ),
              DataCell(
                  Text('Jack')
              ),
              DataCell(
                  Text('22')
              ),
              DataCell(
                  Text('12.33')
              )
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('6')
              ),
              DataCell(
                  Text('Michael')
              ),
              DataCell(
                  Text('18')
              ),
              DataCell(
                  Text('15.23')
              )
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('7')
              ),
              DataCell(
                  Text('Ella')
              ),
              DataCell(
                  Text('10')
              ),
              DataCell(
                  Text('22.33')
              )
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(
                  Text('8')
              ),
              DataCell(
                  Text('Gough')
              ),
              DataCell(
                  Text('2')
              ),
              DataCell(
                  Text('56.77')
              )
            ]
        ),*/