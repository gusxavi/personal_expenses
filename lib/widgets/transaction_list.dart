import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteHandler;

  TransactionList(this.transactions, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, contrainst) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: contrainst.maxHeight * 0.6,
                  child: Icon(
                    Icons.trending_up,
                    color: Colors.grey.withOpacity(0.5),
                    size: 100.0,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map((transaction) => TransactionItem(
                    key: ValueKey(transaction.id),
                    transaction: transaction,
                    deleteHandler: deleteHandler))
                .toList());
  }
}
