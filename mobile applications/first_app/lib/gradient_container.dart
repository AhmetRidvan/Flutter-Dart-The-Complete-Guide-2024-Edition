
import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';
const startAligment = Alignment.bottomLeft; // final = Bir daha değişmeyecek.
const endAligment = Alignment.topRight; // const derlendiği anda kilitlenir.

class GradiantContainer extends StatelessWidget {
  GradiantContainer({super.key, required this.renkler});

  late Color c1;
  late Color c2;
  List<Color>? salla;

  GradiantContainer.oranges({super.key})
      : c1 = Colors.orange,
        c2 = Colors.orangeAccent;

  List<Color>? renkler = [Colors.black, Colors.white24];
 
 

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: startAligment,
            end: endAligment,
            colors: renkler!,
          ),
        ),
        child: Center(
          child: DiceRoller()
        ));
  }
}
