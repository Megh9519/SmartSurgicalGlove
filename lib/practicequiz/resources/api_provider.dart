import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:smart_gloves_demonstration_app/models/category.dart';
import 'package:smart_gloves_demonstration_app/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";                           // Calling the open trivia api from online, can also be used for local data fetching //

Future<List<Question>> getQuestions(Category category, int total, String difficulty) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if(difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }
  http.Response res = await http.get(url);
  List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
  return Question.fromData(questions);
}