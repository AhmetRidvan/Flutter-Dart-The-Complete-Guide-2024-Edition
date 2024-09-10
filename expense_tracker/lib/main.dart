import 'package:expense_tracker/pages/ExpensesPage.dart';
import 'package:flutter/material.dart';

var kColorSheme = ColorScheme.fromSeed(seedColor: Colors.pinkAccent);

void main() {
  //2:00
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: kColorSheme,
      appBarTheme: AppBarTheme(
          foregroundColor: kColorSheme.secondaryContainer,
          backgroundColor: kColorSheme.primary,
          centerTitle: true),
    ),
    home: const ExpensesPage(),
  ));
}
