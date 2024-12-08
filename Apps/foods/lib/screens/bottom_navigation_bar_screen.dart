import 'package:flutter/material.dart';
import 'package:foods/models/food_model.dart';
import 'package:foods/screens/categories_Screen.dart';
import 'package:foods/screens/filters_Screen.dart';
import 'package:foods/screens/foods_screen.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/dra_wer.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarScreen();
  }
}

class _BottomNavigationBarScreen extends State<BottomNavigationBarScreen> {
  int currentPageIndex = 0;
  List<FoodModel> favorites = [];

  void snack(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void addOrRemoveFavorites(FoodModel foodmodel1) {
    bool bool1 = favorites.contains(foodmodel1);
    if (bool1) {
      setState(() {
        favorites.remove(foodmodel1);
        snack("Removed");
      });
    } else {
      setState(() {
        favorites.add(foodmodel1);
        snack("Added");
      });
    }
  }

  void _selectPage(int value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  void _drawerScreenControl(String controlText) {
    Navigator.of(context).pop();
    if (controlText == "Filters") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return FiltersScreen();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = "Categories";

    var color = Theme.of(context).colorScheme;
    Widget page = CategoriesScreen(
      changeFavorites: addOrRemoveFavorites,
      title: title,
    );
    if (currentPageIndex == 1) {
      page = FoodsScreen(
        foodModelList: favorites,
        changeFavorites: addOrRemoveFavorites,
      );
      title = "Favorites";
    }

    return Scaffold(
      appBar: apb(title, Theme.of(context).colorScheme.onPrimary, context),
      drawer: Dra_wer(
        textFunction: (text) {
          _drawerScreenControl(text);
        },
      ),
      body: page,
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (value) {
            _selectPage(value);
          },
          backgroundColor: color.onPrimary,
          items: const [
            BottomNavigationBarItem(
              label: "Categories",
              activeIcon: Icon(
                Icons.pie_chart,
              ),
              icon: Icon(Icons.pie_chart_outline),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite),
              label: "Favorites",
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ]),
    );
  }
}
