import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
            'assets/images/quiz-logo.png',
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
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black),
              foregroundColor: Colors.white,
            ),
            child: const Row(
              children: [
                Icon(Icons.arrow_right_alt),
                Text("Start Quiz"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
