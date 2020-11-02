
import 'package:flutter/material.dart';
import 'package:smart_gloves_demonstration_app/login/login_page.dart';
import 'dart:io';

//This class prevents handshake errors when attempting to connect to a database
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: LoginPage()
    );
  }
}

