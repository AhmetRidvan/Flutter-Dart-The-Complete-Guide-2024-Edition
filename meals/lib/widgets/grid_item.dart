import 'package:flutter/material.dart';
import 'package:meals/models/categoryModel.dart';
// 4:26

class GridItem extends StatelessWidget {
  GridItem({super.key, required this.c1});

  Categorymodel c1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              c1.color.withOpacity(0.5),
              c1.color.withOpacity(0.9),
            ]),
      ),
      child: Text(
        c1.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
