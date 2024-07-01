import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

// 34 left
class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "StartScreen";

  void switchScreen() {
    setState(
      () {
        activeScreen = "QuiestionsScreen";
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen); // learn easy way
    if (activeScreen == "QuiestionsScreen") {
      screenWidget = const QuiestionsScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Colors.lightBlueAccent,
                  Colors.pinkAccent,
                  Colors.deepOrangeAccent,
                ])),
            child: screenWidget),
      ),
    );
  }
}
