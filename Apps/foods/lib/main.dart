import 'package:flutter/material.dart';
import 'package:foods/data/data.dart';
import 'package:foods/screens/categories_Screen.dart';
import 'package:foods/screens/foods_screen.dart';
// 12:02
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.blue,
  ),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const CategoriesScreen());
  }
}
