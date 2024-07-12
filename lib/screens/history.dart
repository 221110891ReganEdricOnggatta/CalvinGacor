import 'package:dana_kedua/models/history.dart';
import 'package:flutter/material.dart';

class MyHistorys extends StatefulWidget {
  const MyHistorys({super.key});

  @override
  State<MyHistorys> createState() => _MyHistorysState();
}

class _MyHistorysState extends State<MyHistorys> {
  final List<HistoryItem> _historyItems = [
    HistoryItem("KFC", 50000.0),
    HistoryItem("MCD", 50000.0),
    HistoryItem("KOPI KENANGAN", 50000.0),
    HistoryItem('Restoran A', 50000.0),
  ];

  final Map<int, bool> _selectedItems = {};

  void _deleteSelectedItems() {
    setState(() {
      _historyItems.removeWhere(
          (item) => _selectedItems[_historyItems.indexOf(item)] == true);
      _selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == "hapus") {
                _deleteSelectedItems();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "hapus",
                child: Text("Hapus"),
              ),
            ],
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(_historyItems[index].restaurantName),
            title: Text("Rp ${_historyItems[index].amount}"),
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
        itemCount: _historyItems.length,
      ),
    );
  }
}
