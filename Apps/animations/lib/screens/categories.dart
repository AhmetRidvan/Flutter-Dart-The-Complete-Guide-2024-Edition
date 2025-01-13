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
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync:
          this, // this _CategoriesScreenState sınıfının nesnesine referanas verir
      duration: Duration(
        milliseconds: 300,
      ),
      lowerBound: 0, // animationController her zaman iki değer arasında çalışır
      upperBound: 1, //0 ile 1 arası standart
    );
    _animationController.forward();
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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          child: child,
          position: _animationController.drive(
            Tween(
              begin: Offset(0, 1), end: Offset(0, 0), // gerçek konumu //offset ters mantık çalışır.
            ),
          ),
        ); //Drive AnimationController lowerBound ve upperBound değerlerini buradaki değerlere dönüştürür.
      },
      child: GridView(
        padding: const EdgeInsets.all(24), //4.45
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //child değişmeyen yenilenmeyen alt öğe
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
