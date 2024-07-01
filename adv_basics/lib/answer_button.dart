import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.answertext,
      required this.onTap,
      super.key}); //üst sınıfa benzersiz kimliğini göndererek performans artışına sebep oluyor.

  final String? answertext;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
          shadowColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white),
      child: Text(
        answertext!,
        textAlign: TextAlign.center,
        style: GoogleFonts.bakbakOne(fontSize: 23, color: Colors.white),
      ),
    );
  }
}
