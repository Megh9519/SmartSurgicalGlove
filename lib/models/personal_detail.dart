import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class PersonalInfo {
  //Private elemets of personal info table
  int _user_id;
  String _fname;
  String _lname;
  String _email;
  String _uname;
  String _password;
  String _utype;

  //Constructors
  PersonalInfo(this._fname,this._lname,this._uname,this._password,this._utype, [this._email]);
  PersonalInfo.withInfo(this._fname,this._lname,this._email,this._uname,this._utype);
  PersonalInfo.withId(this._user_id,this._fname,this._lname,this._uname,this._password,this._utype, [this._email]);

  //List of getters and setters with validations
  int get user_id => _user_id;
  String get fname => _fname;
  String get lname => _lname;
  String get email => _email;
  String get uname => _uname;
  String get password => _password;
  String get utype => _utype;

  set fname(String newfname){
    if(newfname.length <= 20){
      this._fname = newfname;
    }
  }
  set lname(String newlname) {
    if (newlname.length <= 20) {
      this._lname = newlname;
    }
  }
  set email(String newemail) {
    if (newemail.length <= 20) {
      this._email = newemail;
    }
  }
  set uname(String newuname){
    if(newuname.length <= 10){
      this._uname = newuname;
    }
  }
  set password(String newpassword){
    if(newpassword.length <= 8){
      this._password = newpassword;
    }
  }
  set utype(String newutype){
    if(newutype == "ADMIN" || newutype == "USER"){
      this._utype = newutype;
    }
  }

  //Functions converting PersonalInfo Object into the Map object
  //Because Sqflite accepts map objects as data entries
  Map<String, dynamic> toMap(){
  var map = Map<String, dynamic>();

  if( user_id != null){
    map['user_id'] = _user_id;
  }
  map['fname'] = _fname;
  map['lname'] = _lname;
  map['email'] = _email;
  map['uname'] = _uname;
  map['password'] = _password;
  map['utype'] = _utype;

  return map;
  }

  //Function to convert Map object to our PerosonalInfo objects.
  PersonalInfo.fromMapObject(Map<String, dynamic> map){
    this._user_id = map['user_id'];
    this._fname = map['fname'];
    this._lname = map['lname'];
    this._email = map['email'];
    this._uname = map['uname'];
    this._password = map['password'];
    this._utype = map['utype'];
  }

}