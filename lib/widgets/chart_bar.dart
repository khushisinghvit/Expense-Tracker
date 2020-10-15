import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  double spendingPctOfTotal = 0;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  void printer() {
    print('Percentage : ${spendingPctOfTotal.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    printer();
    return Column(
      children: [
        FittedBox(
          //Prevents the child from growing shrinks it
          child: Text(
            '₹${spendingAmount.toStringAsFixed(0)}',
            style: TextStyle(
              fontFamily: 'Opensans',
              color: Color.fromRGBO(23, 208, 181, 1),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 80,
          width: 13,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Opensans',
              color: Color.fromRGBO(209, 19, 111, 1),
              fontSize: 15),
        ),
      ],
    );
  }
}
