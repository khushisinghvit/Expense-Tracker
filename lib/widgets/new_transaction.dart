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

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //Don't execute fot negative values
      return;
    }
    widget.addTx(
      //enteredTitle,
      //enteredAmount,
      titleController.text,
      double.parse(amountController.text),
    );
    //Closses the modal sheet after entering the values
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Colors.teal[500],
                  fontSize: 20,
                ),
              ),
              controller: titleController,
              onSubmitted: (context) => submitData,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                ),
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => {submitData},
              // _ used to ignore the arg
            ),
            RaisedButton(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Color(0xff03dac6),
              onPressed: submitData,
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
