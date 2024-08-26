import 'dart:math';
import 'package:flutter/material.dart';

final randomGenerator = Random();

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int x = 1;

  void shakeIt() {
    setState(() {
      x = randomGenerator.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$x.png",
          width: 200,
        ),
        const SizedBox(
          height: 35,
        ),
        IconButton(
            onPressed: shakeIt,
            icon: const Icon(
              Icons.shuffle,
              size: 80,
              color: Colors.yellow,
            ))
      ],
    );
  }
}
