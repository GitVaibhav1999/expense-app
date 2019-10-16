import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentdatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
    ).then((DateTime pickedDate) {
      if(pickedDate == null) return;
      setState(() {
                _selectedDate = pickedDate;
      });


    });
    print('...');
 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(children: <Widget>[
        Card(
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Text(
                          _selectedDate == null ?
                            'No date Chosen':
                            DateFormat.yMd().format(_selectedDate),
                            ),
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              _presentdatePicker();
                            },
                            
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Add Transaction'),
                      textColor: Colors.white,
                      onPressed: () {
                        widget.addTx(_titleController.text,
                            double.parse(_amountController.text),
                            _selectedDate);
                      },
                    )
                  ],
                ))),
      ]),
    );
  }
}
