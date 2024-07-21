import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.gelencevaplar});

  List<String> gelencevaplar;

  List<Map<String, dynamic>> ozetGetir() {
    List<Map<String, dynamic>> ozet = [];

    for (int x = 0; x < gelencevaplar.length; x++) {
      ozet.add({
        "question_index" : questions[x],
        "question" : questions[x].question,
        "correct_answer" : questions[x].answers[0],
        "user_answer" : gelencevaplar[x]
      });
    }

    return ozet;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered X out of Y questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers and questions"),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
