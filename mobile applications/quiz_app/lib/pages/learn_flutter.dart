import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter(this.LearnFlutter_QuestionsScreen, {super.key});

  final void Function() LearnFlutter_QuestionsScreen;

  @override
  State<LearnFlutter> createState() {
    return _LearnFlutterState();
  }
}

class _LearnFlutterState extends State<LearnFlutter> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 333,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.orbitron(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 60,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              overlayColor: Colors.white,
              side: const BorderSide(color: Colors.white)),
          onPressed: widget.LearnFlutter_QuestionsScreen,
          icon: const Icon(
            size: 33,
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          label: Text(
            "Start Quiz",
            style: GoogleFonts.archivoBlack(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    ));
  }
}
