import 'package:first_app/styledtext.dart';
import 'package:flutter/material.dart';

var startAligment = Alignment.bottomLeft;
var endAligment = Alignment.topRight;

class GradiantContainer extends StatelessWidget {
  const GradiantContainer({super.key});

  @override
  Widget build(context) {
    startAligment = Alignment.bottomCenter;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: startAligment,
            end: endAligment,
            colors: const [Colors.lightBlue, Colors.amberAccent],
          ),
        ),
        child: const Center(child: CustomText()));
  }
}
