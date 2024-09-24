import 'package:flutter/material.dart';
import 'package:update/keys.dart';

import 'package:update/old/ui_updates_demo.dart';
// Hem widget ağacında hem de element ağacında güncellenen kısımlar kirlenir (widgetlerler alt widgetleriyle birlikte) ve yeniden oluşturulur. yeni element tree render tree'de çizilir.
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: const Keys(),
      ),
    );
  }
}
