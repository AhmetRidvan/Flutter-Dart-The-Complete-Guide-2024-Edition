import 'package:flutter/material.dart';
import 'package:foods/data/data.dart';
import 'package:foods/screens/categories_Screen.dart';
import 'package:foods/screens/foods_screen.dart';
import 'package:foods/widgets/app_bar.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarScreen();
  }
}

class _BottomNavigationBarScreen extends State<BottomNavigationBarScreen> {
  int currentPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      currentPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = "Categories";

    var color = Theme.of(context).colorScheme;
    Widget page = CategoriesScreen(
      title: title,
    );
    if (currentPageIndex == 1) {
      page = FoodsScreen(foodModelList: []);
      title = "Favorites";
    }

    return Scaffold(
      appBar: apb(title, Theme.of(context).colorScheme.onPrimary, context),
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
