import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.question),
          const SizedBox(
            height: 30,
          ),
          CustomAnswerButton(
              answerText: currentQuestion.answers[0], onTapFunction: () {}),
          const SizedBox(
            height: 5,
          ),
          CustomAnswerButton(
              answerText: currentQuestion.answers[1], onTapFunction: () {}),
          const SizedBox(
            height: 5,
          ),
          CustomAnswerButton(
              answerText: currentQuestion.answers[2], onTapFunction: () {}),
          const SizedBox(
            height: 5,
          ),
          CustomAnswerButton(
              answerText: currentQuestion.answers[3], onTapFunction: () {}),
        ],
      ),
    );
  }
}
