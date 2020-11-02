import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class ChallengeInfo{
  //private elements of challenge info table
  int _challenge_id;
  String _challenge_name;

  //Constructors
  ChallengeInfo(this._challenge_name);
  ChallengeInfo.withId(this._challenge_id, this._challenge_name);

  int get challenge_id => _challenge_id;
  String get challenge_name => _challenge_name;

  set challenge_name(String challenge){
    this._challenge_name = challenge;
  }
}