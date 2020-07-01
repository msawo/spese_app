import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common.dart';

class NewTransaction extends StatefulWidget {
  final Function transactionHandler;

  NewTransaction({this.transactionHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitInput() {
    if(_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.transactionHandler(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('....');
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
                controller: _titleController,
                onSubmitted: (_) => _submitInput(),
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
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitInput(),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(height: 1.0),
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
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : 'Picked Date: ${DateFormat.MMMEd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).accentColor,
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose a date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: _submitInput,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.button.color,
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
