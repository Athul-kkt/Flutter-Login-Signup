import 'package:SignUp/HomePage.dart';
import 'package:SignUp/SignUp.dart';
import 'package:SignUp/LoginPage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/',
      routes: {
        '/':(context)=> LoginPage(),
        '/SignUp':(context)=>SignUpPage(),
        '/Home':(context)=>MyHomePage(),
      },
    );
  }
}
