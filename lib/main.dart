import 'package:dana_kedua/providers/transactionhistoryprovider.dart';
import 'package:dana_kedua/providers/user.dart';
import 'package:dana_kedua/screens/login/login.dart';
import 'package:dana_kedua/providers/saldoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TransactionHistoryProvider()),
        ChangeNotifierProvider(
          create: (context) => MySaldoProviders(),
        ),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLogins(),
    );
  }
}
