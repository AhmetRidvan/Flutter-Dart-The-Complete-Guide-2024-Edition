import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foods/models/category_model.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/food_item.dart';

class FoodsScreen extends StatelessWidget {
  FoodsScreen(
      {super.key, required this.categoryModel, required this.foodModelList});

  CategoryModel categoryModel;
  List<FoodModel> foodModelList;

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Column(
        children: foodModelList.map(
          (e) {
            return FoodItem(
              foodModel: e,
              color: categoryModel.color,
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
        appBar: apb(categoryModel.title, categoryModel.color, context),
        body: content);
  }
}
