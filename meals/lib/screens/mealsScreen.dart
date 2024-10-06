import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item.dart';
import 'package:meals/models/mealModel.dart';
import 'package:meals/widgets/appbar.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.title, required this.mealsList});

  final String title;
  final List<MealModel> mealsList;

  @override
  Widget build(BuildContext context) {
    Widget w1 = ListView.builder(
      itemCount: mealsList.length,
      itemBuilder: (context, index) {
        return MealItem(m1: mealsList[index]);
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
