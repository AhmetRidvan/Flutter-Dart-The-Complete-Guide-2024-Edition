import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_page.dart';

// 1:30

var kColorSheme = ColorScheme.fromSeed(seedColor: Colors.orange);
var kDarkColorSheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 61, 39, 121),
    brightness: Brightness.dark);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        colorScheme: kDarkColorSheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: kDarkColorSheme
                    .onPrimaryContainer, // onPrimaryContainer burada ismen düşün
                backgroundColor: kDarkColorSheme.primaryContainer)),
      ),
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
              titleLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
