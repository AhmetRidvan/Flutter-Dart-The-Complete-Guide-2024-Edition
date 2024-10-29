import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnswerButton extends StatelessWidget {
  CustomAnswerButton(
      {required this.answerText, required this.onTapFunction, super.key});
  String answerText;
  Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onTapFunction,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(
                  side: BorderSide(color: Colors.yellowAccent, width: 4)),
              overlayColor: Colors.yellowAccent),
          child: Text(
            answerText,
            style: GoogleFonts.archivoBlack(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
