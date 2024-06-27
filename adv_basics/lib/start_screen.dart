import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
   const StartScreen(this.startQuiz, {super.key});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return _customWidget();
  }

  Widget _customWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            color: const Color.fromARGB(177, 255, 255, 255),
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
