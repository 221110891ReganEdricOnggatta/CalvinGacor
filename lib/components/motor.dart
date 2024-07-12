import 'package:dana_kedua/models/cicilan/motor.dart';
import 'package:dana_kedua/models/transactionhistory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dana_kedua/providers/saldoProvider.dart';
import 'package:dana_kedua/providers/transactionHistoryProvider.dart';

class MyMotors extends StatefulWidget {
  const MyMotors({super.key});

  @override
  State<MyMotors> createState() => _MyMotorsState();
}

class _MyMotorsState extends State<MyMotors> {
  final List<PaymentTab> _items = [
    PaymentTab("Vario 155", 34000000),
    PaymentTab("Nmax 155", 27000000),
    PaymentTab("Beat", 15000000),
  ];

  final Map<int, bool> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    final saldoProvider = Provider.of<MySaldoProviders>(context);
    final transactionHistoryProvider =
        Provider.of<TransactionHistoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Motorcycles"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(_items[index].tabName),
                  title: Text("Rp ${_items[index].tabAmount}"),
                  trailing: Checkbox(
                    value: _selectedItems[index] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedItems[index] = value ?? false;
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  height: 1,
                );
              },
              itemCount: _items.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _getTotalSelectedAmount() > 0
                  ? () {
                      double totalAmount = _getTotalSelectedAmount();
                      if (saldoProvider.balance >= totalAmount) {
                        saldoProvider.decreaseBalance(totalAmount);
                        transactionHistoryProvider.addTransaction(
                          TransactionHistory(
                            dateTime: DateTime.now(),
                            action: "Pembayaran Motor",
                            amount: totalAmount,
                            isAddition: false,
                          ),
                        );
                        _removePaidItems();
                        _showSnackBar(context, "Pembayaran berhasil!");
                      } else {
                        _showMaterialBanner(context, "Saldo Anda tidak cukup!");
                      }
                    }
                  : null,
              child: const Text("Bayar"),
            ),
          ),
        ],
      ),
    );
  }

  double _getTotalSelectedAmount() {
    double total = 0.0;
    _selectedItems.forEach((index, selected) {
      if (selected) {
        total += _items[index].tabAmount;
      }
    });
    return total;
  }

  void _removePaidItems() {
    setState(() {
      _selectedItems.forEach((index, selected) {
        if (selected) {
          _items.removeAt(index);
        }
      });
      _selectedItems.clear();
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showMaterialBanner(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
