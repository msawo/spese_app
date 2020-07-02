import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spese_app/widgets/chart.dart';

import '../widgets/chart.dart';
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

  List<Transaction> get _recentTx {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      date: selectedDate,
      title: txTitle,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTx(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
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
              Chart(recentTx: _recentTx,),
              TransactionList(
                transactions: _userTransactions,
                removeTxHandler: _deleteTx,
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
