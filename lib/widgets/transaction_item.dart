import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.yellow,
      Colors.black,
      Colors.blue,
      Colors.orange
    ];
    _bgColor = availableColors[Random().nextInt(5)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('₹${widget.transactions.amount}')),
            ),
          ),
          title: Text(
            widget.transactions.title,
          ),
          subtitle: Text(DateFormat.yMMMd().format(widget.transactions.date)),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () => widget.deleteTx(widget.transactions.id),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  textColor: Colors.red,
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () => widget.deleteTx(widget.transactions.id),
                )),
    );
  }
}
