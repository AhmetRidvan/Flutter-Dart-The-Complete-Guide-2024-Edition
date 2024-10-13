import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
import 'package:meals/models/mealModel.dart';
import 'package:meals/screens/categoriesScreen.dart';
import 'package:meals/screens/mealsScreen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  int selectedItemIndex = 0;
  List<MealModel> _favorites = [];

  void select(int sayi) {
    setState(() {
      selectedItemIndex = sayi;
    });
  }

  void _addOrDeleteFavorites(MealModel m1) {
    if (_favorites.contains(m1)) {
      _favorites.remove(m1);
    } else {
      _favorites.add(m1);
    }
    print("Favoriler tetiklendi.");
  }

  @override
  Widget build(BuildContext context) {
    Widget w1 = CategoriesScreen(
      f1: (nee) {
        _addOrDeleteFavorites(nee);
      },
    );
    String pagetitle = "Categories";

    if (selectedItemIndex == 1) {
      w1 = MealsScreen(
        mealsList: _favorites,
        f1: (nee) {
          _addOrDeleteFavorites(nee);
        },
      );
      pagetitle = "Favorites";
    }

    return Scaffold(
      appBar: appBar(pagetitle, context),
      body: w1,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItemIndex,
          onTap: select,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
          ]),
    );
  }
}
