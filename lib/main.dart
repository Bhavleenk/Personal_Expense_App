import 'package:flutter/material.dart';
import 'package:personalexpense/widgets/chart.dart';

//ctrl+space, alt + enter
import '/widgets/newTransaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.grey.shade600,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(fontFamily: 'Open Sans', fontSize: 18),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly groceries',
    //   amount: 16.04,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final NewTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(NewTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            //FOR COLUMN:main axis is from top to bottom and cross axis is from left to right
            //FOR ROW: it is opposite

            //for 2widgets next to each other
            //   Container(
            //     width: double.infinity,
            //     child:
            //         Card(color: Colors.blue, child: Text('CHART!'), elevation: 5),
            //   ), //text takes as much size as that of the word if u want to change it wrap it in container
            //   TransactionList(_userTransactions),
            //   // Card(
            //   //   color: Colors.red,
            //   //   child: Text('LIST OF TRANSACTIONS'),
            //   // ), // not using card here because we ave more than 1 transactions so we will use column
            //
            //   // Container(
            //   //   height: 80,
            //   //   child: Card(
            //   //     child: ListTile(
            //   //       trailing: Icon(Icons.delete),
            //   //       minLeadingWidth: 100,
            //   //       leading:
            //   //           Container(width: 100, child: Center(child: Text("99"))),
            //   //       title: Text("Pants"),
            //   //       subtitle: Text("Bbibofubaifbo"),
            //   //     ),
            //   //   ),
            //   // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction((context)),
        ),
      ),
    );
  }
}
