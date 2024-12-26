import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/screens/bottom_navigation_bar_screen.dart';
import 'package:foods/screens/nothing.dart';

//6:27
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.blue,
  ),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: "/",
      routes: {
        "Nothing": (context) {
          return Nothing();
        },
      },
      home: const BottomNavigationBarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
