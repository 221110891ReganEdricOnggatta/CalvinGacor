import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dana_kedua/providers/transactionHistoryProvider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionHistoryProvider =
        Provider.of<TransactionHistoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: ListView.builder(
        itemCount: transactionHistoryProvider.transactionHistory.length,
        itemBuilder: (context, index) {
          final transaction =
              transactionHistoryProvider.transactionHistory[index];
          return ListTile(
            title: Text(transaction.action),
            subtitle: Text(transaction.dateTime.toString()),
            trailing: Text(
              "${transaction.isAddition ? "+" : "-"} Rp ${transaction.amount}",
              style: TextStyle(
                color: transaction.isAddition ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
