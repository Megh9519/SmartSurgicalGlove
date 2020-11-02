import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/home/home_page.dart';
import 'package:smart_gloves_demonstration_app/login/sign_up_page.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:password/password.dart';
import 'dart:async';
import 'dart:io';
import 'package:convert/convert.dart';
import 'package:smart_gloves_demonstration_app/models/personal_detail.dart';


class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();

}

//SERVER CONNECTIONs address , needs certificate signed to get data.
String urlCheckUserPassword = "https://ps2025.cdms.westernsydney.edu.au/surgicalDB/login.php";
String urlGetUserInfo = "https://ps2025.cdms.westernsydney.edu.au/surgicalDB/loginGetInfo.php";


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autovalidate = false;
String _password = "";
String _username = "";
String output = "";
bool _user_exists = false;
bool _password_match = false ;
PersonalInfo newUser;


class _LoginPageState extends State<LoginPage>{

  String app_name = "Surgical Glove App";
  String app_description = "SmartGloves Surgical Training";

  //function used to control autovalidation parameter.
  void _make_validation(){
    if(!_formKey.currentState.validate()){
      setState(() {
        _autovalidate = true;
      });
    }
  }

  /*Widget - Text for username and password
  *        - TextArea for username and password*/
  //Password input field
  Widget _login_password(String text, String textBox){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TextFormField(
            maxLength: 16,
            obscureText: true,
            onFieldSubmitted: (_){
              _make_validation();
            },
            validator: (value){
              if(value.isEmpty){
                return text + " required!";
              }else if(!RegExp(r"^[a-z*A-Z*\d*]+").hasMatch(value)){
                return "Password can only contain alphabets and numbers!";
              }
              return null;
            },

            onSaved: (String value){
              _password = value;
            },
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
                color: Colors.black45
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45)
              ),
              labelText: text,
              fillColor: Colors.black45,
              labelStyle: TextStyle(
                  color: Colors.black45
              ),
              contentPadding: EdgeInsets.only(top: 14, left: 5),


            ),
          ),
        )
      ],
    );
  }

  //Ussername input field
  Widget _login_username(String text, String textBox){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TextFormField(
            maxLength: 10,
            onFieldSubmitted: (_){
              _make_validation();
            },
            validator: (String value){
              if(value.isEmpty){
                return text + " required!";
              }
              if(!RegExp(r"^[a-zA-Z0-9]+(([',. -][a-zA-Z0-9 ])?[a-zA-Z0-9]*)*").hasMatch(value)){
                return "Enter valid username with alphabets only!";
              }
              return null;
            },
            onSaved: (String value){
              _username = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.black45
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)
                ),
                labelText: text,
                labelStyle: TextStyle(
                    color: Colors.black45
                ),
                contentPadding: EdgeInsets.only(top: 14, left: 5),
                hintText: textBox,
                hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 10
                )
            ),
          ),
        )
      ],
    );
  }

  //SERVER SIDE CHECK FOR USERNAME AND PASSWORD MATCH
  //POST RESPONSE
  _check_username_password(String username, String password) async{
    var response = await http.post(urlCheckUserPassword,body:{"username": username});
    print("!!!!");
    print(response.body);
    var body = json.decode(response.body);
    final p = body['password'];
    print('$p');

    if (body["exists"]) {
      setState(() {
        _user_exists = true;
        _password_match = false;
      });

      if (Password.verify(password, p)) {
        setState(() {
          _password_match = true;
        });

        print("Login successful!");
      } else {
        //_password_match = false;
        print("Login unsuccessful!");
      }
    }
    else {
      //_user_exists=false;
      print("Login unsuccessful!");
    }

  }

  /*Widget - Welcome image for app*/
  Widget _welcome_image(){
    return Image(
        image: AssetImage('assets/home.jpg')
    );
  }

  /*Widget - Welcome text for app*/
  Widget _welcome_text(){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: <Widget>[
        Text(
          "Smart Gloves",
          style: TextStyle(
              color: Colors.teal[100] ,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          ' "A collaboration between Western Sydney University, Liverpool Hospital'
              'and The Ingham Institute, with funding from The James N.Kirby Foundation" ',
          style: TextStyle(

              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        )

      ],
    );

  }

  //GEtting  the full user data to make session and pass to other screens.
  _get_user_data(PersonalInfo newInfo) async{
    var response = await http.post(urlGetUserInfo,body:{"username": _username});
    var body = json.decode(response.body);
    if(body["exists"]){
      setState(() {
        newUser = new PersonalInfo(body["firstName"],body["lastName"],body["email"],body["username"],body["usertype"]);
      });
    }
    print(newUser.lname);
    //before navigating to home page take all information.
    _navigate_to_home_page(context);
  }

  //if everything done and successful credential for login then move to the home page.
  _final_step() {
    setState(() {
      if (!_user_exists) {
        //_user_exists =false;
        output = "Username or password does not matched!";
      } else if (_user_exists && !_password_match) {
        output = "Password does not match!";
      }else if(_user_exists && _password_match){
        _get_user_data(newUser);
      }
    });
  }
  /*Function to navigate to home screen.*/
  void _navigate_to_home_page(BuildContext context) async{
    await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage(),settings: RouteSettings(arguments: newUser)));
  }
  /*Function to navigate to sign up screen.*/
  void _navigate_to_sign_up_page(BuildContext context) async{
    await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
  }
  /* Widget - Login Button
  *         - Sign-up Button
  *         - Text for privacy policy*/
  Widget _login_button(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        /*This button will take us to the home screen.*/
        FlatButton(
          onPressed:() {
            //After validations
            _make_validation();
            _formKey.currentState.save();
            _check_username_password(_username, _password);
            _final_step();
          },
          child:Image(
            image: AssetImage('assets/loginbtn.jpg'),
            height: 60,
            width: 90,
          ),
          color: Colors.white,
        ),
        /*This button will take us to sign-in page.*/
        FlatButton(
          color: Colors.white,
          onPressed: (){
            _navigate_to_sign_up_page(context);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                decoration: TextDecoration.underline
            ),
          ),
        ),
        Text(
          "Privacy Policy \n Terms of use",
          style: TextStyle(
              fontSize: 9,
              color: Colors.black,
              decoration: TextDecoration.underline
          ),
        )

      ],
    );
  }

  Widget _validation_text(String output){
    return Text(
      output,
      style: TextStyle(
          color: Colors.red,
          fontSize: 10
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: new EdgeInsets.all(15.0),
          child: Form(
              key: _formKey,
              autovalidate: _autovalidate,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      _welcome_image(),
                      SizedBox(height: 10),
                      _welcome_text(),
                      SizedBox(height: 30),
                      _login_username("Username",""),
                      SizedBox(height: 10),
                      _login_password("Password", ""),
                      SizedBox(height: 10),
                      _validation_text(output),
                      SizedBox(height: 10),
                      _login_button(context),
                    ],
                  )
                ],
              )
          )
      ),
    );
  }

}