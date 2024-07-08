import 'package:flutter/material.dart';

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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 333,
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 60,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              overlayColor: Colors.white,
              side: const BorderSide(color: Colors.white)),
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    ));
  }
}
