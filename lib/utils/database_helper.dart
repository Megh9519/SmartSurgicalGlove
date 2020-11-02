import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_gloves_demonstration_app/models/personal_detail.dart';

class DatabaseHelper {
  static final _databaseName = "MyData2base.db";
  static final _databaseVersion = 1;

  static final personal_info_table = 'personalinfo';

  static final coluser_id= "user_id";
  static final colfname="fname",collname="lname",colemail="email",coluname="uname",colpassword="password",colutype="utype";


  //singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + _databaseName;
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $personal_info_table (
            $coluser_id INTEGER PRIMARY KEY,
            $colfname TEXT NOT NULL,
            $collname TEXT NOT NULL,
            $colemail TEXT ,
            $coluname TEXT UNIQUE NOT NULL,
            $colpassword TEXT NOT NULL,
            $colutype TEXT NOT NULL
          )
          ''');
  }



  // Function of fetching data
  Future<List<Map<String, dynamic>>> getPersonalInfoMapList(String username) async{
    Database db = await this.database;
    var result;
    String whereString = '${coluname} = ?';
    List<dynamic> whereArguments = [username];
    try{
      result = await db.query(personal_info_table,where: whereString, whereArgs: whereArguments);
    }catch(Exception){
      print(Exception);
    }

    return result;
  }
  //checks the username with correct password and returns Future<List<MAp>>>
  Future<List<Map<String, dynamic>>> usernameAndPasswordMatched(String username,String password) async{
    Database db = await this.database;
    var result;
    String whereString = '${coluname} = ? && ${colpassword} = ?';
    List<dynamic> whereArguments = [username,password];
    try{
      result = await db.query(personal_info_table,where: whereString, whereArgs: whereArguments);
    }catch(Exception){
      print(Exception);
    }

    return result;
  }
  //Check username exists or not
  Future<int> checkUsernameExists(String username) async{
    Database db = await this.database;
    var result;
    //check the username exists in database
    var check_username = await getPersonalInfoMapList(username);
//    print("This is length");
//    print(check_username.length);
    if(check_username.length != 0){
      return check_username.length;
    }else{
      return 0;
    }
  return result;
  }

  //Function for entering personal entry
  Future<int> insertData(PersonalInfo myinfo) async{
    Database db = await this.database;
    var result;
    try{
      result = await db.insert(personal_info_table, myinfo.toMap());
    }catch(Exception){
      print(Exception);
    }
    return result;
  }

  //Get number of entries in our database
Future<int> getCountPersonalInfo() async{
    Database db = await this.database;
    List<Map<String,dynamic>> c = await db.rawQuery('SELECT COUNT (*) FROM $personal_info_table');
    int result = Sqflite.firstIntValue(c);
    return result;
}

}