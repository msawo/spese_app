import 'package:flutter/material.dart';

import './transaction.dart';
import 'package:flutter/services.dart';
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
  final List<Transaction> _transactions = [
    Transaction(
      id: 'n1',
      amount: 187.98,
      date: DateTime.now(),
      title: 'BURBERRY The City Silver Dial Haymarket Men\'s Watch',
    ),
    Transaction(
      id: 'n2',
      amount: 350.14,
      date: DateTime.now(),
      title: 'Stock purchase on Global Acct.',
    ),
  ];

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
            // TODO: display the list of TX
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
              flex: 7,
              child: Column(
                children: _transactions.map((tx) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                            color: white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        decoration: BoxDecoration(
                          color: accentColor,
                          border: Border.all(
                            color: darkPrimaryColor,
                            width: 2.0,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        constraints: BoxConstraints(maxWidth: 100,minWidth: 100),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style:
                                  TextStyle(color: primaryText, fontSize: 16),
                            ),
                            Text(
                              tx.date.toString(),
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
