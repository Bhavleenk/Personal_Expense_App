import 'package:flutter/material.dart';

import './widgets/userTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //
  // late String titleInput = "title";
  // late String amountInput = "amount";
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //FOR COLUMN:main axis is from top to bottom and cross axis is from left to right
            //FOR ROW: it is opposite

            //for 2widgets next to each other
            Container(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, child: Text('CHART!'), elevation: 5),
            ), //text takes as much size as that of the word if u want to change it wrap it in container
            UserTransactions()
            // Card(
            //   color: Colors.red,
            //   child: Text('LIST OF TRANSACTIONS'),
            // ), // not using card here because we ave more than 1 transactions so we will use column

            // Container(
            //   height: 80,
            //   child: Card(
            //     child: ListTile(
            //       trailing: Icon(Icons.delete),
            //       minLeadingWidth: 100,
            //       leading:
            //           Container(width: 100, child: Center(child: Text("99"))),
            //       title: Text("Pants"),
            //       subtitle: Text("Bbibofubaifbo"),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
