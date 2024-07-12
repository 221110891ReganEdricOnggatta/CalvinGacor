import 'package:flutter/material.dart';

class MySaldoProviders with ChangeNotifier {
  double _balance = 75000;

  double get balance => _balance;

  void tambahSaldo(double amount) {
    _balance += amount;
    notifyListeners();
  }

  void decreaseBalance(double amount) {
    _balance -= amount;
    notifyListeners();
  }
}
