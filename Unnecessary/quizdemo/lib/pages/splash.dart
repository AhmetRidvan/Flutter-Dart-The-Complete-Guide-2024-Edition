import 'package:flutter/material.dart';
import 'package:quizdemo/const/colors.dart';
import 'package:quizdemo/pages/quiz_screen.dart';

class QuizSplashScreen extends StatelessWidget {
  const QuizSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          blue,
          yellow,
          pink,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/baloon.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome to our",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: GestureDetector(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuizScreen(),
                              ));
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        )),
      ),
    );
  }
}
