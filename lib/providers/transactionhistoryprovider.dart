import 'package:dana_kedua/models/transactionhistory.dart';
import 'package:flutter/foundation.dart';

class TransactionHistoryProvider extends ChangeNotifier {
  final List<TransactionHistory> _transactionHistory = [];

  List<TransactionHistory> get transactionHistory => _transactionHistory;

  void addTransaction(TransactionHistory transaction) {
    _transactionHistory.add(transaction);
    notifyListeners();
  }
}
