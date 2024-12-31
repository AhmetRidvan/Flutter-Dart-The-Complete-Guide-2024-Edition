import 'package:flutter/material.dart';
import 'package:foods/data/data.dart';
import 'package:foods/models/category_model.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/screens/foods_screen.dart';
import 'package:foods/widgets/category_gridView_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen(
      {super.key, required this.title,required this.filteredFoods});


  List<FoodModel> filteredFoods;

  String title;
  void _toTheFoodsScreen(BuildContext context, CategoryModel categoryModel1) {
    List<FoodModel> filteredList = filteredFoods.where(
      (element) {
        return element.categories.contains(categoryModel1.id);
      },
    ).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return FoodsScreen(
    
          categoryModel: categoryModel1,
          foodModelList: filteredList,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
