import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/page_control.dart';
import 'package:quiz_app/pages/statistics.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.gelencevaplar,
    required this.rest,
  });

  List<String> gelencevaplar;
  Function() rest;

  //get 2 değişiklik yapman yeterli
  List<Map<String, dynamic>> get ozetGetir {
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
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = ozetGetir
        .where(
          (element) => element["user_answer"] == element["correct_answer"],
        )
        .length;
    print(numOfCorrectQuestions);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Statistics(
            StatisticsData: ozetGetir,
            toplam: numOfTotalQuestions,
            dogru: numOfCorrectQuestions,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {
              print("Restart");
              rest();
            },
            label: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
                Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
