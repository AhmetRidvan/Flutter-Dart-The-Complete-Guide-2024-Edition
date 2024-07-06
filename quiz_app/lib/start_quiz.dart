import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() {
    return _StartQuizState();
  }
}

class _StartQuizState extends State<StartQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              Colors.yellowAccent,
              Colors.pinkAccent,
              Colors.cyanAccent,
              Colors.purpleAccent,
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                color: Colors.white,
                width: 350,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Learn Flutter the fun way!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      overlayColor: Colors.white,
                      side: const BorderSide(color: Colors.white)),
                  onPressed: () {},
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
