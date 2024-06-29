import 'package:flutter/material.dart';

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
      child: Text(answertext!),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white),
    );
  }
}
