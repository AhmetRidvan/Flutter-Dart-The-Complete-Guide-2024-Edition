import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizdemo/services/api_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    quiz = getQuizData();
  }

  late Future quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Colors.cyan, Colors.pinkAccent])),
                child: FutureBuilder(future: quiz, builder: (context, snapshot) {
                   if
                },),
      ),
    );
  }
}
