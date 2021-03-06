import 'package:flutter/material.dart';

import './common.dart';
import './screen/homePage.dart';

void main() => runApp(SpeseApp());

class SpeseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.cyan,
        errorColor: Color(0xffe31c5f),
        fontFamily: 'Bellota',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                color: primaryText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Poiret',
                  fontSize: 22,
                  fontWeight: FontWeight.w200,
                ),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Spese App',
      home: HomePage(),
    );
  }
}
