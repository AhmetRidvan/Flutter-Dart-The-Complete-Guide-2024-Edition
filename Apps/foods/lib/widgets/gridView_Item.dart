import 'package:flutter/material.dart';
import 'package:foods/models/Category_model.dart';

class GridViewItem extends StatelessWidget {
  GridViewItem({super.key, required this.categoryModel});

  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.onPrimary,
          ])),
      height: 100,
      width: 100,
      child: Text(
        categoryModel.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
