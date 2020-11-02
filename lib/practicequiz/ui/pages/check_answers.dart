import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:smart_gloves_demonstration_app/models/question.dart';

class CheckAnswersPage extends StatelessWidget {                                // Creating a stateless widget that returns value from a specific input(check_answers.dart) //
  final List<Question> questions;
  final Map<int,dynamic> answers;

  const CheckAnswersPage({Key key, @required this.questions, @required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context){                                           // widget containing app bar , body and on pressed build items //
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Answers'),
        backgroundColor: Colors.teal[100],
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[100],
              ),
              height: 500,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: questions.length+1,
            itemBuilder: _buildItem,

          )
        ],
      ),
    );
  }
  Widget _buildItem(BuildContext context, int index) {
    if(index == questions.length) {
      return RaisedButton(
        child: Text("Done"),
        color: Colors.teal[100],
        onPressed: (){
          Navigator.of(context).popUntil(ModalRoute.withName(Navigator.defaultRouteName));

        },
      );
    }
    Question question = questions[index];
    bool correct = question.correctAnswer == answers[index];                    // Initializing boolean to receive true values //
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(HtmlUnescape().convert(question.question), style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.0
            ),),
            SizedBox(height: 5.0),
            Text(HtmlUnescape().convert("${answers[index]}"), style: TextStyle( // Correct answers are shown in green and wrong ones with red //
              color: correct ? Colors.green : Colors.red,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5.0),
            correct ? Container(): Text.rich(TextSpan(
              children: [
                TextSpan(text: "Answer: "),
                TextSpan(text: HtmlUnescape().convert(question.correctAnswer) , style: TextStyle(
                  fontWeight: FontWeight.w500
                ))
              ]
            ),style: TextStyle(
              fontSize: 16.0
            ),)
          ],
        ),
      ),
    );
  }
}