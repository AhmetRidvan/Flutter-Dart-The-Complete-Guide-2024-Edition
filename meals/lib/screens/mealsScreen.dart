import 'package:flutter/material.dart';

import 'package:meals/models/mealModel.dart';
import 'package:meals/screens/detailsScreen.dart';
import 'package:meals/widgets/appbar.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.title, required this.mealsList});

  final String title;
  final List<MealModel> mealsList;

  void navi(BuildContext context, MealModel m2) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Detailsscreen(m1: m2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget w1 = ListView.builder(
      itemCount: mealsList.length,
      itemBuilder: (context, index) {
        return MealItem(
          m1: mealsList[index],
          merhaba: (model) {
            return navi(context, model);
          },
        );
      },
    );

    if (mealsList.isEmpty) {
      w1 = const Center(
        child: Text(
          "Nothing here",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(appBar: appBar(title, context), body: w1);
  }
}
