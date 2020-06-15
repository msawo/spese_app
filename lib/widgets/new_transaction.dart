import 'package:flutter/material.dart';

import '../common.dart';

class NewTransaction extends StatefulWidget {
  final Function transactionHandler;


  NewTransaction({this.transactionHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitInput() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.transactionHandler(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                onSubmitted: (_) => submitInput(),
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'i.e Groceries',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: secondaryText,
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
                maxLength: 42,
                textCapitalization: TextCapitalization.words,
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitInput(), 
                decoration: InputDecoration(
                  labelText: 'Amount', labelStyle: TextStyle(height: 1.0),
                  hintText: 'i.e 40.99',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: secondaryText,
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
                maxLength: 9,
              ),
              FlatButton(
                onPressed: submitInput,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 16,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
