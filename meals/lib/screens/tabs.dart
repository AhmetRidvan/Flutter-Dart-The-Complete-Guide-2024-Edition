import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';

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
    
    return Scaffold(
      appBar: appBar("Dynamic..", context),
      body: ...,
      bottomNavigationBar: BottomNavigationBar(onTap: select,items: const [
        BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
      ]),
    );
  }

  
}
