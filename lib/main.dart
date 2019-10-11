import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Glass', amount: 54, date: DateTime.now()),
    Transaction(id: 't2', title: 'Clothes', amount: 80, date: DateTime.now()),
  ];

  final titleController  = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Expense App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Container(

                width: double.infinity,
                child: Card(
                     color: Colors.blue,
                     child: Text('Chart')
                     )
                     ),

                     Card(
                       elevation: 5,
                       child: Container(

                         padding: EdgeInsets.all(10),

                         child:Column(
                           crossAxisAlignment: CrossAxisAlignment.end,

                         children: <Widget>[
                         TextField(
                           decoration: InputDecoration(labelText: 'Title'),
                          controller: titleController,
                           
                           ),
                         TextField(
                           decoration: InputDecoration(labelText: 'Amount'),
                           controller: amountController,
                           ),
                         FlatButton(
                           child: Text('Add Transaction'),
                           textColor: Colors.purple,
                           onPressed: () {
                             print(titleController);
                             print(amountController);
                           },
                         )
                       ],))
                     ),
                 Column(
                  //  mainAxisAlignment: MainAxisAlignment.end,
                  children: transactions.map((tx) {
                    return Card(
                        child: Row(children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(15.0),
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.0),
                          ),
                          child: Text('\$ ${tx.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple))),
                  
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tx.title.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('yyyy-MM-dd').format(tx.date),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ))
                    ]));
                  }).toList(),
                )
          ],
        )

           );
  }
}
