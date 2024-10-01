import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';

import 'package:meals/data/fake_data.dart';
import 'package:meals/screens/mealsScreen.dart';
import 'package:meals/widgets/grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectACategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(title: "Hi", mealsList: fakeMeals),
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
                    selectACategory(context);
                  },
                );
              },
            ),
          ],
        ));
  }
}
