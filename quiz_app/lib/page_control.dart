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
  String activeScreen = "LearnFlutter";

  void switchScreen() {
    setState(() {
      activeScreen = "QuestionsScreen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LearnFlutter(switchScreen);

    if (activeScreen == "QuestionsScreen") {
      screenWidget = const QuestionsScreen();
    }

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
            child: screenWidget),
      ),
    );
  }
}
