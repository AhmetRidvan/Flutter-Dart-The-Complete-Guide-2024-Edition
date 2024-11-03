import 'package:flutter/material.dart';
import 'package:foods/categories_Screen.dart';

final theme = ThemeData( //4.03
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
    return MaterialApp(
      theme: theme,
      home: Categoriesscreen(), 
    );
  }
}
