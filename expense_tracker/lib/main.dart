import 'package:expense_tracker/pages/ExpensesPage.dart';
import 'package:flutter/material.dart';

void main() { //2:00
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true, scaffoldBackgroundColor: Colors.lightBlue),
    home: const ExpensesPage(),
  ));
} 