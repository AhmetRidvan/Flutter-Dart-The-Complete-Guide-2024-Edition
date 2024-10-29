import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/learn_flutter.dart';
import 'package:quiz_app/pages/questions_screen.dart';
import 'package:quiz_app/pages/result_screen.dart';

class PageControl extends StatefulWidget {
  const PageControl({super.key});
  @override
  State<PageControl> createState() {
    return _PageControlState();
  }
}

class _PageControlState extends State<PageControl> {
  List<String> selectedAnswers = [];
  String activeScreen = "LearnFlutter";

  void switchScreen() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = "QuestionsScreen";
    });
  }

  void restart() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = "LearnFlutter";
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);

    if (questions.length == selectedAnswers.length) {
      setState(() {
        activeScreen = "ResultScreen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LearnFlutter(switchScreen);

    if (activeScreen == "QuestionsScreen") {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: addAnswer,
      );
    }

    if (activeScreen == "ResultScreen") {
      screenWidget = ResultScreen(
        gelencevaplar: selectedAnswers,
        rest: restart,
      );
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
