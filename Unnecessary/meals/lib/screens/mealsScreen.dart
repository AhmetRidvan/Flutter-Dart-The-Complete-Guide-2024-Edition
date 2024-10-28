import 'package:flutter/material.dart';
import 'package:meals/models/mealModel.dart';
import 'package:meals/screens/detailsScreen.dart';
import 'package:meals/widgets/appbar.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen(
      {super.key, this.title, required this.mealsList, required this.f1});

  final String? title;
  final List<MealModel> mealsList;
  Function(MealModel nee) f1;

  void navi(BuildContext context, MealModel m2) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Detailsscreen(
        m1: m2,
        f1: f1,
      ),
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

    if (title == null) {
      return w1;
    }

    return Scaffold(
      appBar: appBar(title!, context),
      body: w1,
    );
  }
}
