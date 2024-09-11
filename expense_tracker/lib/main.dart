import 'package:expense_tracker/pages/ExpensesPage.dart';
import 'package:flutter/material.dart';

var kColorSheme = ColorScheme.fromSeed(seedColor: Colors.pinkAccent);

void main() {
  //6:50
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorSheme,
        appBarTheme: AppBarTheme(
          foregroundColor: kColorSheme.secondaryContainer,
          backgroundColor: kColorSheme.primary,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
          color: kColorSheme.primary,
          margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorSheme.primaryContainer))),
    home: const ExpensesPage(),
  ));
}
