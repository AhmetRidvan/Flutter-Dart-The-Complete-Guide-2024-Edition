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
                margin: EdgeInsets.all(14))
            .copyWith(),
        colorScheme: kColorSheme,
        //sadece yaptığın değişiklikleri uygular başka yok
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          foregroundColor: kColorSheme.primaryContainer,
          
          backgroundColor: kColorSheme.onPrimaryContainer,
          toolbarHeight: 100,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
