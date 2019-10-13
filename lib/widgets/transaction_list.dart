import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    //
    //Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView(
          children: <Widget>[
            Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
             children: transactions.map((tx) {
              return Card(
                  child: Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2.0),
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
          ),
        ]));
  }
}
