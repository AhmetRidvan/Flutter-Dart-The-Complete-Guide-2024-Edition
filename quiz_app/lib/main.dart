import 'package:flutter/material.dart';
import 'package:quiz_app/learn_flutter.dart';
//20 Dakika left
void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                Colors.yellowAccent,
                Colors.pinkAccent,
                Colors.purpleAccent,
                Colors.cyanAccent,
              ])),
          child: const StartQuiz(),
        ),
      ),
    );
  }
}
