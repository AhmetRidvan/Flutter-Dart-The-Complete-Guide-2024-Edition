import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, dynamic>> wholeSummary() {
    List<Map<String, dynamic>> yea = [];
    for (int x = 0; x < chosenAnswers.length; x++) {
      yea.add({
        "question_index": x,
        "question_text": Questions[x].text,
        "correct_answer": Questions[x].answers[0],
        "user_answer": chosenAnswers[x],
      });
    }
    return yea;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered X out of Y qestions correctly !"),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers and questions..."),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!")),
          ],
        ),
      ),
    );
  }
}
