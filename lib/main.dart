import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:login/login_screen.dart';

void main(){
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}