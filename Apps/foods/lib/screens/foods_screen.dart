import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foods/models/category_model.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/widgets/app_bar.dart';

class FoodsScreen extends StatelessWidget {
  FoodsScreen(
      {super.key, required this.categoryModel, required this.foodModelList});

  CategoryModel categoryModel;
  List<FoodModel> foodModelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: apb(categoryModel.title, categoryModel.color),
        body: foodModelList.isEmpty
            ? Center(child: const Text("No data "))
            : Column(
                children: foodModelList.map(
                  (e) {
                    return Text(e.title);
                  },
                ).toList(),
              ));
  }
}
