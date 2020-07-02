import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spese_app/models/transaction.dart';

import '../common.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTxHandler;

  TransactionList({this.transactions, this.removeTxHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  '\nNo Transactions added yet.\nClick on the add icon to begin.',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 15.0,
                  width: 300.0,
                  child: Divider(
                    thickness: 0.5,
                    color: dividerColor,
                  ),
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 3.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: FittedBox(
                          child: Text(
                            '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 15.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 1.0,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        constraints:
                            BoxConstraints(maxWidth: 100, minWidth: 100),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transactions[index].title,
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text(
                                DateFormat.yMMMMd("en_US")
                                    .format(transactions[index].date),
                                style: TextStyle(
                                  color: secondaryText,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeTxHandler(transactions[index].id),
                          color: Theme.of(context).errorColor,
                        ),
                        constraints: BoxConstraints(maxWidth: 35),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
