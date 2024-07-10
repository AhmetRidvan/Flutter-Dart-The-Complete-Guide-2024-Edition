import 'package:flutter/material.dart';
import 'package:quiz_app/pages/learn_flutter.dart';
import 'package:quiz_app/pages/questions_screen.dart';

class PageControl extends StatefulWidget {
  const PageControl({super.key});
  @override
  State<PageControl> createState() {
    return _PageControlState();
  }
}

class _PageControlState extends State<PageControl> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = LearnFlutter(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

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
                Colors.green,
              ])),
          child: activeScreen,
        ),
      ),
    );
  }
}
