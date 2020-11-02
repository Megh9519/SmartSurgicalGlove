import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/models/personal_detail.dart';
import 'package:smart_gloves_demonstration_app/utils/database_helper.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:password/password.dart';
import 'package:convert/convert.dart';



class SignUpPage extends StatefulWidget{


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//SERVER CONNECTIONs address , needs certificate signed to get data.
String urlFetch = "https://ps2025.cdms.westernsydney.edu.au/surgicalDB/UserActions.php";
String urlRegister = "https://ps2025.cdms.westernsydney.edu.au/surgicalDB/registerUser.php";
String urlCheckUser = "https://ps2025.cdms.westernsydney.edu.au/surgicalDB/checkRegisterUser.php";
String sign_name = "Sign Up ";
String login_username = "";


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String _fname;
String _lname;
String _email;
String _password;
String _confirmpassword;
String _username;
String _newuser = "USER";
bool _user_exists = false;


//App bar for home screen
Widget _home_screen_appbar(){
  return  AppBar(
      title: Text(sign_name,style: TextStyle( color: Colors.white),),
      backgroundColor: Colors.teal[100],
      actions:  const <Widget>[
//        IconButton(
//          icon: Icon(
//            Icons.power_settings_new,
//            color: Colors.white,
//          ),
//        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
            color: Colors.black12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  login_username,
                  style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
        ),
      )
  );
}

class _SignUpPageState extends State<SignUpPage>{

  //Ussername input field
  Widget _username_input_field(String text, String textBox){
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
              print("check s");
              _check_username(value);
              print("chekc c");
              if(_user_exists){
                return "Username already exists, Enter a unique name!";
              }
              return null;
            },
            onSaved: (String value){
              _username = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.grey[900]
            ),
            decoration: InputDecoration(
                labelText: text,
                labelStyle: TextStyle(
                    color: Colors.grey[800]
                ),
                contentPadding: EdgeInsets.only(top: 14, left: 5),
                hintText: textBox,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                )
            ),
          ),
        )
      ],
    );
  }

  //Email input field
  Widget _email_field(String text, String textBox){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TextFormField(
            maxLength: 20,
            onFieldSubmitted: (_){
              _make_validation();
            },
            validator: (value){
              if(value.isEmpty){
                return text + " required!";
              }
              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                return "Enter valid email address!";
              }
              return null;
            },
            onSaved: (String value){
              _email = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.grey[900]
            ),
            decoration: InputDecoration(
                labelText: text,
                labelStyle: TextStyle(
                    color: Colors.grey[800]
                ),

                contentPadding: EdgeInsets.only(top: 14, left: 5),
                hintText: textBox,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                )
            ),
          ),
        )
      ],
    );
  }

  //Password input field
  Widget _password_field(String text, String textBox){
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
              }else{
                if(text == "Password"){
                  _password = value;
                }else if(text == "Confirm Password"){
                  _confirmpassword = value;
                }
              }
              if( (text == "Confirm Password") && (_confirmpassword != _password)){
                return "Password not mathced!";
              }

              return null;
            },

            onSaved: (String value){
              if(text=="Confirm Password"){
                _password = value;
              }
            },
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(
                  color: Colors.grey[800]
              ),
              contentPadding: EdgeInsets.only(top: 14, left: 5),

            ),
          ),
        )
      ],
    );
  }

  //First name input field
  Widget _namefirst_input_field(String text, String textBox){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,

          child: TextFormField(
            maxLength: 20,
            onFieldSubmitted: (_){
              _make_validation();
            },
            validator: (String value){
              if(value.isEmpty){
                return text + " required!";
              }
              if(!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*").hasMatch(value)){
                return "Enter valid name with alphabets only!";
              }
              return null;
            },
            onSaved: (String value){
              _fname = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.grey[900]
            ),
            decoration: InputDecoration(
                labelText: text,
                labelStyle: TextStyle(
                    color: Colors.grey[800]
                ),
                contentPadding: EdgeInsets.only(top: 14, left: 5),
                hintText: textBox,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                )
            ),
          ),
        )
      ],
    );
  }

  //Last name input field
  Widget _namelast_input_field(String text, String textBox){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,

          child: TextFormField(
            maxLength: 20,
            onFieldSubmitted: (_){
                _make_validation();
            },
            validator: (String value){
              if(value.isEmpty){
                return text + " required!";
              }
              if(!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*").hasMatch(value)){
                return "Enter valid name with alphabets only!";
              }
              return null;
            },
            onSaved: (String value){
              _lname = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.grey[900]
            ),
            decoration: InputDecoration(
                labelText: text,
                labelStyle: TextStyle(
                    color: Colors.grey[800]
                ),
                contentPadding: EdgeInsets.only(top: 14, left: 5),
                hintText: textBox,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                )
            ),
          ),
        )
      ],
    );
  }

  //User type radio button
  Widget _select_user_type(BuildContext context){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
            value: "USER",
            groupValue: _newuser,
            activeColor: Colors.black,
            onChanged: (radioButtonValue){
              print(radioButtonValue);
              setSelectedUser(radioButtonValue);
            }
        ),
        Text(
          "USER",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14
          ),
        ),
        Radio(
            value: "ADMIN",
            groupValue: _newuser,
            activeColor: Colors.black,
            onChanged: (radioButtonValue2){
              print(radioButtonValue2);
              setSelectedUser(radioButtonValue2);
            }
        ),
        Text(
          "ADMIN",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14
          ),
        ),
      ],
    );
  }

  setSelectedUser(String val){
    setState(() {
      _newuser = val;
    });
  }

  //On input validations.
  bool _autovalidate = false;

  void _make_validation(){
    if(!_formKey.currentState.validate()){
      setState(() {
        _autovalidate = true;
      });
    }
  }

  //SERVER SIDE INSERTION OF DATA,
  //POST RESPONCE TO REGISTER USER
  _register_user(PersonalInfo personalInfo) async{
    //hashing of password by password library
    var hashedPassword = Password.hash(personalInfo.password, PBKDF2());
    print(hashedPassword);
    //http post responce
    var response = await http.post(urlRegister,body:{"firstName": personalInfo.fname, "lastName": personalInfo.lname, "email": personalInfo.email, "username": personalInfo.uname, "password": hashedPassword, "type": personalInfo.utype});

    var body = json.decode(response.body);

    if(body['success']){
      print('!!!!! ${body['success']}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      setState(() {
        _fname = "";
        _lname = "";
        _email = "";
        _username = "";
        _password = "";
        _confirmpassword = "";
        SnackBar(
          content: Text("Sign Up successful !"),
        );
      });
    }else{
      print("error");
    }
  }

  //SERVER SIDE CHECK FOR USERNAME
  //POST RESPONCE
  _check_username(String username) async{
    //http post responce
    var response = await http.post(urlCheckUser,body:{"username": username});

    var body = json.decode(response.body);
    //defining the existence of username in database
    if(body['exist']){
      _user_exists = true;
      print("exist ture");
      print('!!!!! ${body['exist']}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }else{
      _user_exists = false;
      print("exist flse");
    }
  }
  //Submit button for user registration.
  Widget _submit_btn(BuildContext context){
    return RaisedButton(
      color: Colors.grey,
      onPressed: (){
        _make_validation();
        _formKey.currentState.save();

        var newInfo = new PersonalInfo(_fname, _lname, _username, _password, _newuser,_email);
        print(newInfo.fname);
        print(newInfo.lname);
        print(newInfo.uname);
        print(newInfo.email);
        print(newInfo.utype);
        print(newInfo.password);

        _register_user(newInfo);
        },
      child: Text(
        "Create Account",
        style: TextStyle(
            color: Colors.black,
            fontSize: 16
        ),
      ),
    );
  }




  //Create account form
  Widget _create_account(BuildContext context){
    return Form(
      key: _formKey,
      autovalidate: _autovalidate,
      child: ListView(
        primary: false,
        padding: const EdgeInsets.all(40),
        shrinkWrap: true,
        children: <Widget>[
          _namefirst_input_field("First Name", "First Name"),
          SizedBox(height:20),
          _namelast_input_field("Last Name", "Last Name"),
          SizedBox(height:20),
          _email_field("Email Address", "abc@gmail.com"),
          SizedBox(height:20),
          _username_input_field("Username", "Username"),
          SizedBox(height:20),
          _password_field("Password", "********"),
          SizedBox(height:20),
          _password_field("Confirm Password", "********"),
          //SizedBox(height: 20),
          //_select_user_type(context),
          SizedBox(height:30),
          _submit_btn(context),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _home_screen_appbar(),
        body: new Stack(
          children: <Widget>[
          _create_account(context),
          ],
        )
    );
  }
}