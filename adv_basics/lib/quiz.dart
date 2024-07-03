import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_scree.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

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

  chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (Questions.length == selectedAnswers.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = "ResultsScreen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "QuiestionsScreen") {
      screenWidget = QuiestionsScreen(
        cevapFonk: chooseAnswer,
      );
    }
    if (activeScreen == "ResultsScreen") {
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers,);
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
