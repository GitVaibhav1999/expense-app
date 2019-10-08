import './transaction.dart';

import 'package:flutter/material.dart';

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
    Transaction(id: 't1', title: 'Shoes', amount: 70, date: DateTime.now()),
    Transaction(id: 't2', title: 'Veggies', amount: 40, date: DateTime.now()),
    Transaction(id: 't2', title: 'Drinks', amount: 90, date: DateTime.now()),
    
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Expense App'),
        ),
        body: 
          
            // Container(
            //     width: double.infinity,
            //     child: //Card(
            //     //     color: Colors.blue,
            //     //     child: Text('Chart')
            //     //     ))
            // )
             Container(
                width: double.infinity,
                height: double.maxFinite,
                child:       
            Column(
               mainAxisAlignment: MainAxisAlignment.end,
              children: transactions.map((tx) {
                return Card(
                    child: Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    padding:  EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple,width: 2.0),
                    ),
                    child: Text(
                      tx.amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple
                      )
                      )
                  ),
                  Container(
                    padding:  EdgeInsets.all(15.0),
                    child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[ 
                      Text(
                        tx.title.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      Text(
                        tx.date.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 13,),
                        ) 
                        ],
                  ))
                ])
                );
              }).toList(),
            )
          
        
        )
        );
  }
}
