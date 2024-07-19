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
  List<String> selectedAnswers = []; // cevapları saklayacağız.
  String activeScreen = "LearnFlutter";

  void switchScreen() {
    setState(() {
      activeScreen = "QuestionsScreen";
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LearnFlutter(switchScreen);

    if (activeScreen == "QuestionsScreen") {
      screenWidget =  QuestionsScreen(onSelectedAnswer: addAnswer,);
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
