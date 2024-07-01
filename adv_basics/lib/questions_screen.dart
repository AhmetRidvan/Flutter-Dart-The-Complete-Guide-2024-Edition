import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuiestionsScreen extends StatefulWidget {
  const QuiestionsScreen({super.key});

  @override
  State<QuiestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuiestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestionIndex() {
    if (currentQuestionIndex < Questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(context) {
    final currentQuestion = Questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.actor(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQuestion.getShuffleAnswers().map(
              (e) {
                return AnswerButton(
                  answertext: e,
                  onTap: answerQuestionIndex,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
/*
map listedeki her bir elemanı gezer ve herbirine müdahale edebilmeni sağlar.

... listeleri tek bir listede birleşirmek için kullanılır.
*/