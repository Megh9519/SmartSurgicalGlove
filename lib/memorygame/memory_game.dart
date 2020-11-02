import 'package:flutter/material.dart';

import 'flipcardgame.dart';
import 'data.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  @override
  Widget build(BuildContext context) {                                          // Creating a state widget with container that will show the flip card items aligned in a set parameters //
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => _list[index].goto,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: _list[index].primarycolor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black45,
                                spreadRadius: 0.5,
                                offset: Offset(3, 4))
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: _list[index].secomdarycolor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12,
                                spreadRadius: 0.3,
                                offset: Offset(
                                  5,
                                  3,
                                ))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                                _list[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                      Shadow(
                                          color: Colors.green,
                                          blurRadius: 2,
                                          offset: Offset(0.5, 2))
                                    ]),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: genratestar(_list[index].noOfstar),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> genratestar(int no) {                                            // Setting difficulty level with star icons //
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.amber,
          ));
    }
    return _icons;
  }
}

class Details {                                                                 // Listing items //
  String name;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;
  int noOfstar;

  Details(
      {this.name,
        this.primarycolor,
        this.secomdarycolor,
        this.noOfstar,
        this.goto});
}

List<Details> _list = [                                                         // Creating game level //
  Details(
      name: "EASY",
      primarycolor: Colors.black,
      secomdarycolor: Colors.teal,
      noOfstar: 1,
      goto: FlipCardGane(Level.Easy)),
  Details(
      name: "MEDIUM",
      primarycolor: Colors.black,
      secomdarycolor: Colors.teal,
      noOfstar: 2,
      goto: FlipCardGane(Level.Medium)),
  Details(
      name: "HARD",
      primarycolor: Colors.black,
      secomdarycolor: Colors.teal,
      noOfstar: 3,
      goto: FlipCardGane(Level.Hard))
];
