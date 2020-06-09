import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/user_transactions.dart';
import './common.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Card(
                child: Container(
                  width: double.infinity,
                  child: Text('CHART',
                      style: TextStyle(
                        fontSize: 19,
                        color: primaryColor,
                      )),
                ),
                elevation: 5,
                color: Colors.blueGrey.shade300,
              ),
              flex: 3,
            ),
            Flexible(
              child: UserTransaction(),
              flex: 9,
            ),
          ],
        ),
      ),
    );
  }
}
