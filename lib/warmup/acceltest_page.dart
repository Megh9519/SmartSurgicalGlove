
//import 'dart:html';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:oscilloscope/oscilloscope.dart';
import 'dart:async';
//TODO: Add a black cover over the screen to provide more details about the challenge
class AccelTest extends StatefulWidget{
  @override
  _AccelTestState createState() => _AccelTestState();
}

class _AccelTestState extends State<AccelTest> {
  List<double> traceX = List();
  List<double> traceY = List();
  List<double> traceZ = List();
  Timer _timer;
  bool isRunning = true;

  // Initalising the events to be recieved from the accelerometer
  AccelerometerEvent event;
  StreamSubscription accel;

//This function creates the lines by listening for the events coming back from the accelerometer
  _generateTrace(Timer t) {
    accel = accelerometerEvents.listen((AccelerometerEvent event) {
      var xVal = event.x;
      var yVal = event.y;
      var zVal = event.z;
      if(isRunning){        //isRunning disposes of the events after the page closes
        setState(() {
          traceX.add(xVal);
          traceY.add(yVal);
          traceZ.add(zVal);
        });
      }

    });
  }

  @override
  initState() {
    super.initState();
    // create our timer to generate test values
    _timer = Timer.periodic(Duration(milliseconds: 5000), _generateTrace);
  }


//Dispose is responsible for closing all subscriptions and stop listening for any events after the page closes
  @override
  void dispose() {
    isRunning = false;
    _timer.cancel();
    accel.pause();
    accel?.cancel();
    super.dispose();
  }
//styling and laying out the graphs
  @override
  Widget build(BuildContext context) {
    Oscilloscope scopeOne = Oscilloscope(
      showYAxis: true,
      yAxisColor: Colors.black,
      padding: 20.0,
      backgroundColor: null,
      traceColor: Colors.green,
      yAxisMax: 10.0,
      yAxisMin: -10.0,
      dataSet: traceX,
    );

    Oscilloscope scopeTwo = Oscilloscope(
      showYAxis: true,
      yAxisColor: Colors.black,
      padding: 20.0,
      backgroundColor: null,
      traceColor: Colors.orange,
      yAxisMax: 10.0,
      yAxisMin: -10.0,
      dataSet: traceY,
    );

    Oscilloscope scopeThree = Oscilloscope(
      showYAxis: true,
      yAxisColor: Colors.black,
      padding: 20.0,
      backgroundColor: null,
      traceColor: Colors.blue,
      yAxisMax: 10.0,
      yAxisMin: -10.0,
      dataSet: traceZ,

    );
    // Generate the Scaffold
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("Accelerometer Demo"),
        ),
        body: Column(

        children: <Widget>[
          Container(
              child:Text("Green: X-axis Orange: Y-axis Blue: Z-axis", style: TextStyle(fontSize: 18),),) ,
           Expanded(flex: 2,
                child:scopeOne),
          Expanded(
        flex: 2,
        child: scopeTwo,
      ),
        Expanded(flex: 2, child: scopeThree),
          ],
        )
    );
  }
}
