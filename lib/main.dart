import 'package:expense_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';
import './widgets/new_transaction.dart';

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

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

        final List<Transaction> _userTransactions = [
      
    ];

    void _addNewTransaction(String title, double  amount) { 
      print('pat your back');
      final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString()
        
        );
        
void startAddNewTransaction(BuildContext ctx) {
  showModalBottomSheet(context: ctx, builder: (_) {
    return NewTransaction();
  },);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Expense App'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add),onPressed: (){},),
          ],
        ),
        body: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Card(color: Colors.blue, child: Text('Chart'))),
                  UserTransaction()
            ],
            
          ),
        ),
       // floatingActionButtonLocation: ,
        floatingActionButton: FloatingActionButton(
          child: 
          Icon(Icons.add),
          onPressed: (){},
          backgroundColor: Colors.purple,
          ),
        );
  }
}
