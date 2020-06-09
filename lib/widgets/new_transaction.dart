import 'package:flutter/material.dart';

import '../common.dart';

class NewTransaction extends StatelessWidget {
  final Function transactionHandler;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({this.transactionHandler});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'i.e Groceries',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: secondaryText,
                  ),
                ),
                cursorColor: primaryColor,
                maxLength: 42,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            Expanded(
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'i.e 40.99',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: secondaryText,
                  ),
                ),
                cursorColor: primaryColor,
                maxLength: 9,
              ),
            ),
            FlatButton(
              onPressed: () {
                transactionHandler(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              color: primaryColor,
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
    );
  }
}
