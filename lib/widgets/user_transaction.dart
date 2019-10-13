import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  UserTransaction_State createState() => UserTransaction_State();
}

class UserTransaction_State extends State<UserTransaction> {



    


setState(() {
  _userTransactions.add(newTx);
  });}

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[NewTransaction(_addNewTransaction),
       TransactionList(_userTransactions)
       ],
      
    );
  }
}
UserTransaction userTransaction= new UserTransaction();
