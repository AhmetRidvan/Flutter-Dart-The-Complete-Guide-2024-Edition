import 'package:flutter/material.dart';
import 'package:meals/models/categoryModel.dart';

class GridItem extends StatelessWidget {
  GridItem({super.key, required this.c1});

  CategoryModel c1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }
}
