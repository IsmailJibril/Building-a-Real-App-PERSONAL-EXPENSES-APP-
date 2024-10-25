import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTx;

  const TransactionList({required this.transactions, required this.deletTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constrains) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView(
              children: transactions
                  .map(
                    (tx) => TransactionItem(
                      Key: ValueKey(tx.id),
                      transaction: tx,
                      deletTx: deletTx,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
