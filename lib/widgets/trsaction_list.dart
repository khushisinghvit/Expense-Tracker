import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  //Returns the card with all the data
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    'No transactions added yet !',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ) //if block
          : ListView.builder(
              //else block
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                  )),
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  elevation: 4,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '₹ ${transaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontFamily: 'Opensans'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(transaction[index].title,
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.tealAccent[700],
                                      fontFamily: 'Quicksand')),
                            ),
                            Text(
                              DateFormat('dd MMMM yyyy HH:mm')
                                  .format(transaction[index].date),
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontFamily: 'Opensans'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }

  Color swatch = Color.fromRGBO(23, 56, 13, 1.0);
  Color rmPurple = Color.fromRGBO(64, 31, 156, 1.0);
  Color pinkyPink = Color.fromRGBO(219, 39, 147, 0.89);
}
