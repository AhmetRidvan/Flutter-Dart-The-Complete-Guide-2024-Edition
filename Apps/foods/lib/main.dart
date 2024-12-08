import 'package:flutter/material.dart';
import 'package:foods/screens/bottom_navigation_bar_screen.dart';
import 'package:foods/screens/filters_Screen.dart';

//6.36
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
    return MaterialApp(
      theme: theme,
      home: BottomNavigationBarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
