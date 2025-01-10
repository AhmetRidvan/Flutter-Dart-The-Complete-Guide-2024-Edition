import 'package:animations/data/dummy_data.dart';
import 'package:animations/models/category.dart';
import 'package:animations/models/meal.dart';
import 'package:animations/screens/meals.dart';
import 'package:animations/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  //Tek animationcontroller olunca böyle eyer birden fazla olsaydı TickerProviderStateMixin
  late AnimationController
      _animationController; // this _CategoriesScreenState sınıfının nesnesine referanas verir

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
      lowerBound: 0, // animationController her zaman iki değer arasında çalışır
      upperBound: 2, //0 ile 1 arası standart
    );
  }

  @override
  void dispose() {
    // AnimationController veya Stream gibi dinleyicileri iptal etmek için kullanılır. Kaynakları serbest bırakmak içindir.
    _animationController.dispose(); 
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
