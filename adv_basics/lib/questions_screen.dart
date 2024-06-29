import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class QuiestionsScreen extends StatefulWidget {
  const QuiestionsScreen({super.key});

  @override
  State<QuiestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuiestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = Questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          ...currentQuestion.answers.map(
            (e) {
              return AnswerButton(
                answertext: e,
                onTap: () {},
              );
            },
          )
        ],
      ),
    );
  }
}
/*
map listedeki her bir elemanı gezer ve herbirine müdahale edebilmeni sağlar.

... listeleri tek bir listede birleşirmek için kullanılır.
*/