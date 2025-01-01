import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foods/models/food_model.dart';
import 'package:foods/providers/favorite_food_provider.dart';
import 'package:foods/providers/foods_provider.dart';
import 'package:foods/screens/categories_Screen.dart';
import 'package:foods/screens/filters_Screen.dart';
import 'package:foods/screens/foods_screen.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/dra_wer.dart';

final kFilter = {
  Filter.lactoseFree: false,
  Filter.gluterFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class BottomNavigationBarScreen extends ConsumerStatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  ConsumerState<BottomNavigationBarScreen> createState() {
    return _BottomNavigationBarScreen();
  }
}

class _BottomNavigationBarScreen
    extends ConsumerState<BottomNavigationBarScreen> {
  int currentPageIndex = 0;
 
  Map<Filter, bool> selectedFilters = kFilter;

 

  void _selectPage(int value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  void _drawerScreenControl(String controlText) async {
    Navigator.of(context).pop();
    if (controlText == "Filters") {
      var result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) {
          return FiltersScreen(
            currentFilters: selectedFilters,
          );
        },
      ));
      setState(() {
        print(result);
        selectedFilters = result ?? kFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var foodProvider1 = ref.watch(foodProvider);

    var availableFoods = foodProvider1.where(
      (element) {
        if (selectedFilters[Filter.lactoseFree]! && !element.isLactoseFree) {
          return false;
        }
        if (selectedFilters[Filter.gluterFree]! && !element.isGlutenFree) {
          return false;
        }
        if (selectedFilters[Filter.vegetarian]! && !element.isVegetarian) {
          return false;
        }
        if (selectedFilters[Filter.vegan]! && !element.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    for (var asd in availableFoods) {
      print(asd.title);
    }

    String title = "Categories";
    var color = Theme.of(context).colorScheme;

    Widget page = CategoriesScreen(
      filteredFoods: availableFoods,
      title: title,
    );
    if (currentPageIndex == 1) {
      final favorites2 = ref.watch(FavoriteFoodStateNotifierProvider);
      page = FoodsScreen(
        foodModelList: favorites2,
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
