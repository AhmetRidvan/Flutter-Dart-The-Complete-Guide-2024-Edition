import 'package:flutter/material.dart';
import 'package:foods/models/category_model.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/screens/foods_details_screen.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/food_item.dart';

class FoodsScreen extends StatelessWidget {
  FoodsScreen(
      {super.key,
      this.categoryModel,
      required this.foodModelList,
  });

  CategoryModel? categoryModel;
  List<FoodModel> foodModelList;
 

  void toFoodsDetailsScreenFunction_1(
      FoodModel foodmodel, BuildContext context, Color color) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return FoodsDetailsScreen(
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
              color: Theme.of(context).colorScheme.onPrimary,
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

    if (categoryModel == null) {
      return content;
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: apb(categoryModel!.title, categoryModel!.color, context),
        body: content);
  }
}
