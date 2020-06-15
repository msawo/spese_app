import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/new_transaction.dart';
import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import '../common.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'n1',
    //   amount: 187.98,
    //   date: DateTime.now(),
    //   title: 'Burberry CitySilver Dl Men\'s Watch',
    // ),
    // Transaction(
    //   id: 'n2',
    //   amount: 250.30,
    //   date: DateTime.now(),
    //   title: 'Stock purchase on Global Acct.',
    // ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      date: DateTime.now(),
      title: txTitle,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startTxProcess(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => GestureDetector(
        onTap: () {},
        child: NewTransaction(transactionHandler: _addNewTransaction),
        behavior: HitTestBehavior.opaque,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spese Tracking',
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () => _startTxProcess(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  height: 200,
                  color: Theme.of(context).primaryColorLight,
                  width: double.infinity,
                  child: Placeholder(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                elevation: 5,
                color: Colors.blueGrey.shade300,
              ),
              TransactionList(
                transactions: _userTransactions,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _startTxProcess(context),
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
