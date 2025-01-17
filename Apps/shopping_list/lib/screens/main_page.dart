import 'package:flutter/material.dart';
import 'package:shopping_list/data/grocery_items_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Your Groceries"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: groceryItemsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    color: groceryItemsList[index].category.color,
                    width: 30,
                    height: 30,
                  ),
                  title: Text(groceryItemsList[index].name),
                  trailing: Text(groceryItemsList[index].quantity.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
