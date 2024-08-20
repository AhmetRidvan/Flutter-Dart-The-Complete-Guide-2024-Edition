import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_page.dart';

// 1:30
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          //sadece yaptığın değişiklikleri uygular başka yok
          appBarTheme: const AppBarTheme(
            color: Colors.red,
            toolbarHeight: 100,
          ),
          scaffoldBackgroundColor: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
