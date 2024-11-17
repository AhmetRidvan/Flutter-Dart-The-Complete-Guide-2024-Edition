import 'package:flutter/material.dart';

class FoodItemMeta extends StatelessWidget {
  FoodItemMeta({super.key, required this.icon, required this.text});

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
