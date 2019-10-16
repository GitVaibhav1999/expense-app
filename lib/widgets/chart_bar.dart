import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FittedBox(child: Text('${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Expanded(
          flex: 1,
                  child: Container(
            height: 10,
            width: 10,
            child: Stack(
              
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1.0),
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(-10),
                )),
                FractionallySizedBox(heightFactor: 1-spendingPctOfTotal,
                child: Container(decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(-10),
                ),),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    ));
  }
}
