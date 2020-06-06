import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(SpeseApp());

class SpeseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spese App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Card(
                child: Container(
                  width: double.infinity,
                  child: Text('CHART', style: TextStyle(fontSize: 19)),
                ),
                elevation: 5,
                color: Colors.blueGrey.shade300,
              ),
              flex: 3,
            ),
            Flexible(
              child: Card(
                child: Container(
                  child: Text(
                    'Tansaction list',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                color: Colors.blueGrey.shade800,
              ),
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
