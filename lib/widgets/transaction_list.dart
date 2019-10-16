import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    //
    //Widget build(BuildContext context) {
    return Container(
        height: 470,
        child:
            transactions.isEmpty ? 
            SingleChildScrollView(child: 
             Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'No Transaction added Yet !!!!',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 60,),
            Container(
              height: 250,
            
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,
              )
            )
             ]
             )
            ,)
            : 
            ListView(
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
                    Expanded(
                          flex: 1,
                          child: Container(
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
                              ),
                             
                            ],
                          )),
                    ),
                         IconButton(icon: Icon(Icons.delete,color: Colors.purpleAccent),
                         onPressed: (){
                           deleteTx(tx.id);
                         },),

                  ],));
                }).toList(),
              ),
             
            ]),
          
        );
  }
}
