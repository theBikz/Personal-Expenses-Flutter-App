import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('₹${transactions.amount}')),
            ),
          ),
          title: Text(
            transactions.title,
          ),
          subtitle: Text(DateFormat.yMMMd().format(transactions.date)),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () => deleteTx(transactions.id),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  textColor: Colors.red,
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () => deleteTx(transactions.id),
                )),
    );
  }
}
