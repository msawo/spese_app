import 'package:flutter/material.dart';

import './screen/homePage.dart';

void main() => runApp(SpeseApp());

class SpeseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.cyan,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Spese App',
      home: HomePage(),
    );
  }
}

