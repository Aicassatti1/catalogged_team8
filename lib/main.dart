import 'package:flutter/material.dart';
import './pages/intro_page.dart';
import './pages/signin_page.dart';
import './pages/signup_page.dart';
import 'package:catapp/catalogged_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogged',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        SigninPage.routeName: (ctx) => SigninPage(),
        SignupPage.routeName: (ctx) => SignupPage()
      },
    );
  }
}
