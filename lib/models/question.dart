enum Type {                                                                     // Initialize boolean //
  multiple,
  boolean
}

enum Difficulty {
  easy,
  medium,
  hard
}

class Question {                                                                // Creating class Question //
  final String categoryName;
  final Type type;
  final Difficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question({this.categoryName, this.type, this.difficulty, this.question, this.correctAnswer, this.incorrectAnswers}); // Setting questions module //

  Question.fromMap(Map<String, dynamic> data):
    categoryName = data["category"],
    type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
    difficulty = data["difficulty"] == "easy" ? Difficulty.easy : data["difficulty"] == "medium" ? Difficulty.medium : Difficulty.hard,
    question = data["question"],
    correctAnswer = data["correct_answer"],
    incorrectAnswers = data["incorrect_answers"];

  static List<Question> fromData(List<Map<String,dynamic>> data){
    return data.map((question) => Question.fromMap(question)).toList();
  }

}

// Here is the format for the json file that holds the quiz questions, answers, and options.//
// At the moment the questions are fetched from the online free database "https://opentdb.com/api.php" (Open trivia DB) //
// Using the json file format below we can create questions and can fetch it from our local database //
// Please check api_provider.dart file to fetch the data from local database //
// use the code format below to make quiz questions, categories and more. Save it as a json file and call it from the local database using the URL in the api_provider.dart //

//{
//   "response_code": 0,
//   "results": [
//     {
//       "category": "General Knowledge",
//       "type": "multiple",
//       "difficulty": "hard",
//       "question": "What type of dog is &#039;Handsome Dan&#039;, the mascot of Yale University?",
//       "correct_answer": "Bulldog",
//       "incorrect_answers": [
//         "Yorkshire Terrier",
//         "Boxer",
//         "Pug"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "boolean",
//       "difficulty": "easy",
//       "question": "Video streaming website YouTube was purchased in it&#039;s entirety by Facebook for US$1.65 billion in stock.",
//       "correct_answer": "False",
//       "incorrect_answers": [
//         "True"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "boolean",
//       "difficulty": "easy",
//       "question": "French is an official language in Canada.",
//       "correct_answer": "True",
//       "incorrect_answers": [
//         "False"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "boolean",
//       "difficulty": "easy",
//       "question": "Nutella is produced by the German company Ferrero.",
//       "correct_answer": "False",
//       "incorrect_answers": [
//         "True"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "multiple",
//       "difficulty": "easy",
//       "question": "Which of these colours is NOT featured in the logo for Google?",
//       "correct_answer": "Pink",
//       "incorrect_answers": [
//         "Yellow",
//         "Blue",
//         "Green"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "boolean",
//       "difficulty": "easy",
//       "question": "You can legally drink alcohol while driving in Mississippi.",
//       "correct_answer": "True",
//       "incorrect_answers": [
//         "False"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "multiple",
//       "difficulty": "medium",
//       "question": "The term &quot;scientist&quot; was coined in which year?",
//       "correct_answer": "1833",
//       "incorrect_answers": [
//         "1933",
//         "1942",
//         "1796"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "multiple",
//       "difficulty": "easy",
//       "question": "What color is the &quot;Ex&quot; in FedEx Ground?",
//       "correct_answer": "Green",
//       "incorrect_answers": [
//         "Red",
//         "Light Blue",
//         "Orange"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "multiple",
//       "difficulty": "medium",
//       "question": "What is the Portuguese word for &quot;Brazil&quot;?",
//       "correct_answer": "Brasil",
//       "incorrect_answers": [
//         "Brazil",
//         "Brasilia",
//         "Bras&iacute;l"
//       ]
//     },
//     {
//       "category": "General Knowledge",
//       "type": "multiple",
//       "difficulty": "medium",
//       "question": "A statue of Charles Darwin sits in what London museum?",
//       "correct_answer": "Natural History Museum",
//       "incorrect_answers": [
//         "Tate",
//         "British Museum",
//         "Science Museum"
//       ]
//     }
//   ]
// }//