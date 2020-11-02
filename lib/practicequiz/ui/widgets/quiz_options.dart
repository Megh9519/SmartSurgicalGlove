import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/models/category.dart';
import 'package:smart_gloves_demonstration_app/models/question.dart';
import 'package:smart_gloves_demonstration_app/practicequiz/resources/api_provider.dart';
import 'package:smart_gloves_demonstration_app/practicequiz/ui/pages/error.dart';
import 'package:smart_gloves_demonstration_app/practicequiz/ui/pages/quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category category;

  const QuizOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {                // Creating a state widget //
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState() { 
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override                                                                     // Creating 5 different number of question with different levels //
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.teal[100],
              child: Text(widget.category.name, style: Theme.of(context).textTheme.title.copyWith(),),
            ),
            SizedBox(height: 10.0),
            Text("Select Total Number of Questions"),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,
                children: <Widget>[
                  SizedBox(width: 0.0),
                  ActionChip(
                    label: Text("10"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _noOfQuestions == 10 ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectNumberOfQuestions(10),
                  ),
                  ActionChip(
                    label: Text("20"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _noOfQuestions == 20 ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectNumberOfQuestions(20),
                  ),
                  ActionChip(
                    label: Text("30"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _noOfQuestions == 30 ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectNumberOfQuestions(30),
                  ),
                  ActionChip(
                    label: Text("40"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _noOfQuestions == 40 ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectNumberOfQuestions(40),
                  ),
                  ActionChip(
                    label: Text("50"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _noOfQuestions == 50 ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectNumberOfQuestions(50),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20.0),                                             // Creating difficulty level selection //
            Text("Select Difficulty"),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 16.0,
                spacing: 16.0,
                children: <Widget>[
                  SizedBox(width: 0.0),
                  ActionChip(
                    label: Text("Any"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _difficulty == null ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectDifficulty(null),
                  ),
                  ActionChip(
                    label: Text("Easy"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _difficulty == "easy" ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectDifficulty("easy"),
                  ),
                  ActionChip(
                    label: Text("Medium"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _difficulty == "medium" ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectDifficulty("medium"),
                  ),
                  ActionChip(
                    label: Text("Hard"),
                    labelStyle: TextStyle(color: Colors.black),
                    backgroundColor: _difficulty == "hard" ? Colors.amber[100] : Colors.teal[100],
                    onPressed: () => _selectDifficulty("hard"),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20.0),                                             // Creating input field //
            processing ? CircularProgressIndicator() : RaisedButton(
              child: Text("Start Quiz"),
              onPressed: _startQuiz,
              color: Colors.teal[100],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      _difficulty=s;
    });
  }

  void _startQuiz() async {
    setState(() {
      processing=true;
    });
    try {
      List<Question> questions =  await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if(questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ErrorPage(message: "There are no available quizzes at the moment, Weekly and Monthly Quizzes are coming soon. Thank You !!!",)
        ));
        return;                                                                 // Checking Api for questions if none is found //
      }
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => QuizPage(questions: questions, category: widget.category,)
      ));
    }on SocketException catch (_) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorPage(message: "Can't reach the servers, \n Please check your internet connection.",) // if no internet connection //
      ));
    } catch(e){
      print(e.message);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorPage(message: "Unexpected error trying to connect to the API",) // if it can not fetch the api //
      ));
    }
    setState(() {
      processing=false;
    });
  }
}