import 'package:flutter/material.dart';
import 'package:foods/data/data.dart';
import 'package:foods/models/category_model.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/screens/foods_screen.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/category_gridView_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _toTheFoodsScreen(BuildContext context, CategoryModel categoryModel1) {
    List<FoodModel> _filteredList = FoodsList.where(
      (element) {
        return element.categories.contains(categoryModel1.id);
      },
    ).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return FoodsScreen(
          categoryModel: categoryModel1,
          foodModelList: _filteredList,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: GridView.builder(
        itemCount: CategoriesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemBuilder: (context, index) {
          return CategoryGridViewItem(
            categoryModel: CategoriesList[index],
            touchedCategory: () {
              _toTheFoodsScreen(context, CategoriesList[index]);
            },
          );
        },
      ),
      appBar: apb(
          "Pick your category", Theme.of(context).colorScheme.primary, context),
    );
  }
}