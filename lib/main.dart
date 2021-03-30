import 'package:flutter/material.dart';
import 'screens/landing.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Hype Fans',
          theme: ThemeData(
//              primaryColor: Color.fromRGBO(50, 65, 85, 1),
              primaryColor: Colors.white,
              textTheme: TextTheme(title: TextStyle(color: Colors.black))),
          home: LandingPage());
  }
}