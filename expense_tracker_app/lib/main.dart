import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_page.dart';

// 1:30

var kColorSheme = ColorScheme.fromSeed(seedColor: Colors.orange);

void main() {
  runApp(
    MaterialApp(
      // ignore: prefer_const_constructors
      theme: ThemeData().copyWith(
          cardTheme: CardTheme(
                  color: kColorSheme.secondaryContainer,
                  margin: const EdgeInsets.all(14))
              .copyWith(),
          colorScheme: kColorSheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorSheme.primaryContainer)),
          //Sadece yaptığın değişiklikleri uygular başka yok
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: kColorSheme.onPrimaryContainer,
            toolbarHeight: 100, // 7:51
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(color: Colors.red, fontSize: 22))),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
