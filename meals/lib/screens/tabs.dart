import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
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
 
  void select(int sayi){
    setState(() {
      selectedItemIndex = sayi;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget w1 = CategoriesScreen();
    if(selectedItemIndex ==1){
      w1 = MealsScreen(title: "Favorites", mealsList: []);
    }

    return Scaffold(
      appBar: appBar("Dynamic..", context),
      body: w1,
      bottomNavigationBar: BottomNavigationBar(onTap: select,items: const [
        BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
      ]),
    );
  }

  
}
