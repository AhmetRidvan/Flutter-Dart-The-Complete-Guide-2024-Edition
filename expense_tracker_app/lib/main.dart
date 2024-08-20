import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_page.dart';

// 1:30

var kColorSheme = ColorScheme.fromSeed(seedColor: Colors.orange);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorSheme,
        //sadece yaptığın değişiklikleri uygular başka yok
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
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
