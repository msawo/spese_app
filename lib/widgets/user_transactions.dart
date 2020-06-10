import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'n1',
      amount: 187.98,
      date: DateTime.now(),
      title: 'BURBERRY The City Silver Dial Men\'s Watch',
    ),
    Transaction(
      id: 'n2',
      amount: 250.30,
      date: DateTime.now(),
      title: 'Stock purchase on Global Acct.',
    ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(transactionHandler: _addNewTransaction),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
