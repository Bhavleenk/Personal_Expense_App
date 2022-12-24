import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart'; //.. tells dart to go one level up in lib

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, //the container the space it can take
      child: ListView.builder(
        //column with single child scrool view
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    //transaction.amount.toString(), or below
                    //'\$${transaction.amount}', or
                    '\₹${transactions[index].amount}',

                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd').format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
        // children: transactions.map((transaction) {
        //   );
        // }).toList(),
      ),
    );
  }
}
