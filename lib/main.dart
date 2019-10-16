import 'package:expense_app/widgets/new_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';


void main() => runApp(MyApp());

//---------------------------------------------------|

// --------------------------------------------------|

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(
            fontFamily: 'OpenSans',fontSize: 20)
            )),
            
      ),
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
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    print('pat your back');
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: DateTime.now().toString(),
        );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id)
  {
    setState(() => _userTransactions.removeWhere((tx) => tx.id == id)
    );
  }
  

  void _startAddNewTransaction(BuildContext ctx) {
    showCupertinoDialog(
      
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false ,
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Expense App',
          
          
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
                // decoration: BoxDecoration(
                //           border: Border.all(color: Colors.purpleAccent, width: 4.0),
                          
                        // ),
              height: 200,
              child: Chart(_recentTransactions),
              ),
              SingleChildScrollView(child: TransactionList(_userTransactions,_deleteTransaction),)
            
          ],
        ),
      
      // floatingActionButtonLocation: ,
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () => _startAddNewTransaction(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
