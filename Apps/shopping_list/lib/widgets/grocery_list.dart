import 'package:flutter/material.dart';
import 'package:shopping_list/data/grocery_items_data.dart';
import 'package:shopping_list/model/grocery_item_model.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItemModel> _groceryItems = [];

  void _addItem() async {
    var newItem =
        await Navigator.of(context).push<GroceryItemModel>(MaterialPageRoute(
      builder: (context) {
        return NewItem();
      },
    ));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem); //2:00
    });
  }

  void _removeFromList(GroceryItemModel m1) {
    _groceryItems.remove(m1);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Deleted"),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget _content = Center(
      child: Text("Nothing here"),
    );

    if (_groceryItems.isNotEmpty) {
      _content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              _removeFromList(_groceryItems[index]);
            },
            key: ValueKey(_groceryItems[index].id),
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary,
              ),
              width: 50,
              height: 50,
            ),
            child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 30,
                height: 30,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text(_groceryItems[index].quantity.toString()),
            ),
          );
        },
      );
    }

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
        body: _content);
  }
}
