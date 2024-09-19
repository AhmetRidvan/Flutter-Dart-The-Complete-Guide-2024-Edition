import 'package:expense_tracker/pages/ExpensesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//5:04

var kLightColorSheme = ColorScheme.fromSeed(
  seedColor: Colors.pinkAccent,
  brightness: Brightness.light,
);
var kDarkColorSheme =
    ColorScheme.fromSeed(seedColor: Colors.grey, brightness: Brightness.dark);

void main() {
  //5:20
  //6:50
  // copywith sadece istenilen değişikliği yapmaya yarar temayı bozmaz.
 /*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) {
     
     
    },
  );
 */ 
  runApp(MaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          colorScheme: kDarkColorSheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kDarkColorSheme.primaryContainer)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.white)),
          cardTheme: CardTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
            color: kDarkColorSheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
          ),
        ),
        theme: ThemeData(
            colorScheme: kLightColorSheme,
            appBarTheme: AppBarTheme(
              foregroundColor: kLightColorSheme.secondaryContainer,
              backgroundColor: kLightColorSheme.primary,
              centerTitle: true,
            ),
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33)),
              color: kLightColorSheme.primary,
              margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kLightColorSheme.primaryContainer))),
        home: const ExpensesPage(),
      ));
}
