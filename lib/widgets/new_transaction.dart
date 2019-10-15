import 'package:flutter/material.dart';



class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 300,
      child: ListView(
        
            children: <Widget>[ Card(
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      keyboardType: TextInputType.text,
                      
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        widget.addTx(titleController.text,
                        double.parse(amountController.text));
                      } ,
                    )
                    
                  ],
                ))),]
      ),
    );
  }
}
