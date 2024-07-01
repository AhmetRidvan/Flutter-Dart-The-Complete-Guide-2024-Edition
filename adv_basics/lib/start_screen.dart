import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return _customWidget();
  }

  Widget _customWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            color: const Color.fromARGB(177, 255, 255, 255),
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.anton(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton.icon(
            style:
                OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
            onPressed: startQuiz,
            label: Text(
              "Start Quiz",
              style: GoogleFonts.zhiMangXing(color: Colors.white, fontSize: 30),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
