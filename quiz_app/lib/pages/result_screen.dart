import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/statistics.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.gelencevaplar});

  List<String> gelencevaplar;

  List<Map<String, dynamic>> ozetGetir() {
    List<Map<String, dynamic>> ozet = [];

    for (int x = 0; x < gelencevaplar.length; x++) {
      ozet.add({
        "question_index": x,
        "question": questions[x].question,
        "correct_answer": questions[x].answers[0],
        "user_answer": gelencevaplar[x],
      });
    }

    return ozet;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = ozetGetir();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = data.where(
      (element) {
        return element["user_answer"] == element["correct_answer"];
      },
    ).length;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "You answered $numOfCorrectQuestions out of $numOfTotalQuestions questions correctly!",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Statistics(StatisticsData: data),
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
