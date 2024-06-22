import 'package:first_app/styledtext.dart';
import 'package:flutter/material.dart';

const startAligment = Alignment.bottomLeft; // final = Bir daha değişmeyecek.
const endAligment = Alignment.topRight; // const derlendiği anda kilitlenir.

class GradiantContainer extends StatelessWidget {
  GradiantContainer({super.key,required this.colors});

  List<Color> colors;

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: startAligment,
            end: endAligment,
            colors: colors,
          ),
        ),
        child: const Center(child: CustomText("Merhaba")));
  }
}
