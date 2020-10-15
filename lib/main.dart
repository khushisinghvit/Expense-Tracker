import 'package:Project2/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/trsaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          color: Colors.pink[800],
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(fontFamily: 'Opensans', fontSize: 20),
              ),
        ),
        fontFamily: 'Quicksand', //The fontfamily
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];

//Transactions younger than 7 are included in this list
  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10,
        //backgroundColor: Colors.pink[800],
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.indigo,
        title: Text(
          'Money Manager',
          style: TextStyle(fontSize: 23, fontFamily: 'Quicksand'),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
          child: ClipOval(
            child: Image.asset(
              'assets/images/mypher.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () => _startAddNewTransaction(context),
            padding: EdgeInsets.all(5),
          )
        ], //Used to add buttons to action bar
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.alphaBlend(Colors.blue, Colors.cyan),
        foregroundColor: Colors.white,
        label: Text(
          'Add',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        icon: Icon(
          Icons.account_balance,
          size: 30,
        ),
        onPressed: () => _startAddNewTransaction(context),
        elevation: 10,
      ),
    );
  }
}
