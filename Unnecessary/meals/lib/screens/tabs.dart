import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
import 'package:meals/Widgets/myDrawer.dart';
import 'package:meals/data/fake_data.dart';
import 'package:meals/models/mealModel.dart';
import 'package:meals/screens/categoriesScreen.dart';
import 'package:meals/screens/filterscreen.dart';
import 'package:meals/screens/mealsScreen.dart';

var KInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

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
  Map<Filter, bool> _selectedFilters = KInitialFilters;

  void select(int sayi) {
    setState(() {
      selectedItemIndex = sayi;
    });
  }

  void yilan(String message) {
   
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _addOrDeleteFavorites(MealModel m1) {
    if (_favorites.contains(m1)) {
      setState(() {
        _favorites.remove(m1);
        yilan("Meal is no longer a favorite");
      });
    } else {
      setState(() {
        _favorites.add(m1);
        yilan("Meal added");
      });
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

    void _setScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "f") {
        var _result = await Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => FilterScreen(),
        ));
        _selectedFilters = _result ?? KInitialFilters;
        print(_result);
      }
    }

    return Scaffold(
      drawer: Mydrawer(
        merhaba: _setScreen,
      ),
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
