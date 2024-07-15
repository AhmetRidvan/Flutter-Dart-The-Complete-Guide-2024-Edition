import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomAnswerButton extends StatelessWidget {
  CustomAnswerButton(
      {required this.answerText, required this.onTapFunction, super.key});
  String answerText;
  Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTapFunction,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(
                  side: BorderSide(color: Colors.yellowAccent, width: 4)),
              overlayColor: Colors.yellowAccent),
          child: Text(answerText),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
