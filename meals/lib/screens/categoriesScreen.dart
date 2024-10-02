import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';

import 'package:meals/data/fake_data.dart';
import 'package:meals/models/categoryModel.dart';
import 'package:meals/models/mealModel.dart';
import 'package:meals/screens/mealsScreen.dart';
import 'package:meals/widgets/grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectACategory(BuildContext context, CategoryModel m1) {
    final filteredMeals = fakeMeals
        .where(
          (element) => element.categories.contains(m1.id),
        )
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          MealsScreen(title: m1.title, mealsList: filteredMeals),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Pick your category", context),
        body: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: [
            ...fakeCategories.map(
              (e) {
                return GridItem(
                  c1: e,
                  islev: () {
                    selectACategory(context, e);
                  },
                );
              },
            ),
          ],
        ));
  }
}
