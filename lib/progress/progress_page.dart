import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget{
  @override
  _ProgressPageState createState() => _ProgressPageState();
}
String progress_name = "Progress ";
String login_username = "";
Widget _progress_screen_appbar(){
  return  AppBar(
      title: Text(progress_name,style: TextStyle( color: Colors.white),),
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

enum radioButton{
  Summary, Detail
}

class _ProgressPageState extends State<ProgressPage>{
  List<String> _types = ['Practice', 'Challenge',];
  String _selectedTypes;

  DateTime _dateTime;

  List<String> _metric = ['Smoothness', 'Steadiness', 'Speed','Accuracy'];
  String _selectedMetrics;

  List<String> _versus = ['Completion Time', 'Overall Metric'];
  String _selectedVersus;

  radioButton _radioSelect = radioButton.Summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: _progress_screen_appbar(),
      body: Container(
        color: Colors.black12,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
              children: <Widget>[
                Row( //ROW 1 ~ TYPE W/ DROPDOWN MENU
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text('Type',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                      ),
                    ),
                    Container(
                      child: DropdownButton(
                        dropdownColor: Colors.black45,
                        hint: Text('Select',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                        ),
                        value: _selectedTypes,
                        //
                        onChanged: (newValue) {
                          setState(()
                          {_selectedTypes = newValue;});},
                        items: _types.map((location) {
                          return DropdownMenuItem(
                            child: Text(location, style: TextStyle(color: Colors.white),),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row( // ROW 2 ~ IMAGE OF CHART
                  //THIS WILL NEED TO BE REPLACED WITH A CHART THAT SHOWS THE SCORE AGAINST THE DATES
                  children: <Widget>[
                    Image.asset('assets/chart1.jpg'),
                  ],
                ),


                Row( // ROW 3 ~ DATE/TIME W/ DROPDOWN MENU
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        child: Text('Date/Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),),
                      ),
                      Container(
                        child:Column(
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.grey,
                                child: Text('Select a Date',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20),
                                ),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                                    firstDate: DateTime(2019),
                                    lastDate: DateTime(2021),
                                  ).then((date) {
                                    setState(() {
                                      _dateTime = date;
                                    });
                                  });
                                }
                            ),
                          ],
                        ),
                      ),
                    ]),

                Row( //ROW 4 ~ METRIC W/ DROPDOWN MENU
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text('Metric',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                      ),
                    ),
                    Container(
                      child: DropdownButton(
                        dropdownColor: Colors.black45,
                        hint: Text('Select',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                        ),
                        value: _selectedMetrics,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedMetrics = newValue;
                          });
                        },
                        items: _metric.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location, style: TextStyle(color: Colors.white),),
                            value: location,
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                Row( //ROW 5 ~ VERSUS W/ DROPDOWN MENU
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text('Versus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                      ),
                    ),
                    Container(
                      child: DropdownButton(
                        dropdownColor: Colors.black45,
                        hint: Text('Select',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                        ),
                        value: _selectedVersus,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedVersus = newValue;
                          });
                        },
                        items: _versus.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location, style: TextStyle(color: Colors.white),),
                            value: location,
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                Row( //ROW 6 ~ RADIO BUTTONS: SUMMARY + DETAIL
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Radio(
                          value: radioButton.Summary,
                          activeColor: Colors.green,
                          groupValue: _radioSelect,
                          onChanged: (radioButtonValue){
                            setState(() {
                              _radioSelect = radioButtonValue;
                            });
                          }
                      ),
                    ),
                    Text('Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    ),
                    Container(
                      child: Radio(

                        value: radioButton.Detail,
                        activeColor: Colors.green,
                        groupValue: _radioSelect,
                        onChanged: (radioButtonValue2){
                          setState(() {
                            _radioSelect = radioButtonValue2;
                          });
                        },
                      ),

                    ),
                    Text('Detail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                    ),
                  ],
                ),

                Row( // ROW 7 ~ IMAGE OF CHART
                  children: <Widget>[
                    Image.asset('assets/chart2.jpg'),
                  ],
                ),

                Row(  //ROW 8 ~ OVERALL SCORE
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //will need add Feedback link
                      child: Text('Overall Score: 70 - FEEDBACK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                      ),
                    ),
                  ],
                ),

              ]
          ),
        ),
      ),
    );
  }

}