import 'package:flutter/material.dart';
import 'package:foods/models/category_model.dart';

class CategoryGridViewItem extends StatelessWidget {
  CategoryGridViewItem(
      {super.key, required this.categoryModel, required this.touchedCategory});

  CategoryModel categoryModel;
  Function() touchedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        touchedCategory();
      },
      borderRadius: BorderRadius.all(Radius.circular(500)),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  categoryModel.color,
                  categoryModel.color.withOpacity(0.5)
                ])),
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
