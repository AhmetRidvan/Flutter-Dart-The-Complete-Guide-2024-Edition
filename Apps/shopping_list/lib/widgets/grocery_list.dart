import 'package:flutter/material.dart';
import 'package:shopping_list/data/grocery_items_data.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return NewItem();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add),
          ),
        ],
        title: Text("Your Groceries"),
      ),
      body: ListView.builder(
        itemCount: groceryItemsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groceryItemsList[index].name),
            leading: Container(
              width: 30,
              height: 30,
              color: groceryItemsList[index].category.color,
            ),
            trailing: Text(groceryItemsList[index].quantity.toString()),
          );
        },
      ),
    );
  }
}
