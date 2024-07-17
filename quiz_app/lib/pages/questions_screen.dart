import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/pages/custom_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int counter = 0;

  void increase() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[counter];
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.anton(fontSize: 25),
              currentQuestion.question,
            ),
            const SizedBox(
              height: 60,
            ),
            ...currentQuestion.karistir().map(
              (e) {
                return CustomAnswerButton(
                  answerText: e,
                  onTapFunction: increase,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
