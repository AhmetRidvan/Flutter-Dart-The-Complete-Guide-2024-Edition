import 'package:flutter/material.dart';
import 'package:foods/models/category_model.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/screens/foods_details_screen.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/food_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen(
      {super.key,
      required this.foodModelList,
      required this.color,
      required this.text});

  List<FoodModel> foodModelList;
  Color color;
  String text;

  void toFoodsDetailsScreenFunction_1(
      FoodModel foodmodel, BuildContext context, Color color) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return FoodsDetails(
          foodModel: foodmodel,
          color: color,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Column(
        children: foodModelList.map(
          (e) {
            return FoodItem(
              foodModel: e,
              color: color,
              toFoodsDetailsScreenFunction: (foodmodel, context2, color) {
                toFoodsDetailsScreenFunction_1(foodmodel, context, color);
              },
            );
          },
        ).toList(),
      ),
    );

    if (foodModelList.isEmpty) {
      content = Center(
          child: Text(
        "No data !",
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
      ));
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: apb(text, color, context),
        body: content);
  }
}
