//import 'dart:html';
import 'dart:async';
//import 'dart:html';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:quiver/async.dart';

class HoldSteadyGame extends StatefulWidget{
  @override
  _HoldSteadyGameState createState() => _HoldSteadyGameState();
}

class _HoldSteadyGameState extends State<HoldSteadyGame> {

  //Setting the values of the countdown timer
  int _start = 10;
  int _current = 10;


  Color color = Colors.greenAccent;

  // event returned from accelerometer stream
  AccelerometerEvent event;

  // hold a refernce to these, so that they can be disposed
  Timer timer;
  StreamSubscription accel;

  // positions and count
  double top = 125;
  double left;
  int count = 0;

  // variables for screen size
  double width;
  double height;

  setColor(AccelerometerEvent event) {
    // Calculate Left
    double x = ((event.x * 12) + ((width - 100) / 2));
    // Calculate Top
    double y = event.y * 12 + 125;

    // find the difference from the target position
    var xDiff = x.abs() - ((width - 100) / 2);
    var yDiff = y.abs() - 125;

    // check if the circle is centered, currently allowing a buffer of 3 to make centering easier
    if (xDiff.abs() < 3 && yDiff.abs() < 3) {
      // set the color and increment count
      setState(() {
        color = Colors.greenAccent;
        count += 1;
      });
    } else {
      // set the color and restart count
      setState(() {
        color = Colors.red;
        count = 0;
      });
    }
  }

  setPosition(AccelerometerEvent event) {
    if (event == null) {
      return;
    }

    // When x = 0 it should be centered horizontally
    setState(() {
      left = ((event.x * 12) + ((width - 100) / 2));
    });

    // When y = 0 it should have a top position matching the target, which we set at 125
    setState(() {
      top = event.y * 12 + 125;
    });
  }


  startTimer() {
    // if the accelerometer subscription hasn't been created, create it
    if (accel == null) {
      accel = accelerometerEvents.listen((AccelerometerEvent eve) {
        setState(() {
          event = eve;
        });
      });
    } else {
      // it has already ben created so just resume it
      accel.resume();
    }
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
    });
    //Once the countdown has finished, dispose of the countdown.
    sub.onDone(() {
      sub.cancel();
    });

    // Accelerometer events come faster than we need them so a timer is used to only proccess them every 200 milliseconds
    if (timer == null || !timer.isActive) {
      timer = Timer.periodic(Duration(milliseconds: 200), (_) {
        // if count has increased greater than 3 call pause timer to handle success
        if (count > 3) {
          pauseTimer();
          sub.cancel();
        } else {
          // proccess the current event
          setColor(event);
          setPosition(event);
        }
      });
    }
  }

  pauseTimer() {
    // stop the timer and pause the accelerometer stream
    timer.cancel();
    accel.pause();

    // set the success color and reset the count
    setState(() {
      count = 0;
      color = Colors.green;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    accel?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //find and return the width and height of the screen
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hold Steady Game'),

      ),
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Keep the circle in the center for 1 second',style: TextStyle(color: Colors.white, fontSize: 16),),
          ),
          Stack(
            children: [
              // Empty container given a width and height to set the size of the stack
              Container(
                height: height / 2,
                width: width,
              ),

              // Outer target circle wrapped in a Positioned
              Positioned(
                // positioned 50 from the top of the stack
                // and centered horizontally, left = (ScreenWidth - Container width) / 2
                top: 50,
                left: (width - 250) / 2,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(125),
                  ),
                ),
              ),
              // This is the colored circle that will be moved by the accelerometer
              // the top and left are variables that will be set
              Positioned(
                top: top,
                left: left ?? (width - 100) / 2,
                // the container has a color and is wrapped in a ClipOval to make it round
                child: ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: color,
                  ),
                ),
              ),
              // inner target circle wrapped in a Positioned
              Positioned(
                top: 125,
                left: (width - 100) / 2,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),

            ],
          ),
          Text('x: ${(event?.x ?? 0).toStringAsFixed(3)}',style: TextStyle(color: Colors.white, fontSize: 16),),
          Text('y: ${(event?.y ?? 0).toStringAsFixed(3)}',style: TextStyle(color: Colors.white, fontSize: 16),),
            RaisedButton(
              onPressed: startTimer,
               child: Text('Begin'),
              color: Theme
                  .of(context)
                  .primaryColor,
               textColor: Colors.white,
             ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Time Left: $_current seconds!',style: TextStyle(fontSize: 20, color: Colors.white)),
          )
        ],
      ),
    );
  }
}