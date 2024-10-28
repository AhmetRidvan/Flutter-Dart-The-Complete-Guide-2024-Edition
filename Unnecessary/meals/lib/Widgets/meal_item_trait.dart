import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  MealItemTrait({super.key, required this.i, required this.s});

  IconData i;
  String s;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          i,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          s,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
