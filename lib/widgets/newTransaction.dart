import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ), //receives user input
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              //onChanged: (value) => amountInput
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.purple)),
              child: Text('Add Transaction'),
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
                //print(amountController.value)
              },
            )
          ],
        ),
      ),
    );
  }
}
