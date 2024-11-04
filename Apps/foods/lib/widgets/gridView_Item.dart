import 'package:flutter/material.dart';
import 'package:foods/models/Category_model.dart';

class GridViewItem extends StatelessWidget {
  GridViewItem({super.key, required this.categoryModel});

  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.all(Radius.circular(500)),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        margin: EdgeInsets.all(12),
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
