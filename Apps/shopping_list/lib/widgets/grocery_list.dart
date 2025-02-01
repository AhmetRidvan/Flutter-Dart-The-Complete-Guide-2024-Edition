import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories_data.dart';
import 'package:shopping_list/data/grocery_items_data.dart';
import 'package:shopping_list/model/category_model.dart';
import 'package:shopping_list/model/grocery_item_model.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItemModel> _groceryItems = [];
  bool _isloading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final _url = Uri.https(
        'my-database-880f1-default-rtdb.firebaseio.com', 'shopping_list.json');
    try {
      final response = await http.get(_url);

      print(response.statusCode);
      final List<GroceryItemModel> _temporaryList = [];

      Map<String, dynamic>? listData = json.decode(response.body);
      if (listData != null) {
        for (final x in listData.entries) {
          final category = categoriesMap.entries.firstWhere(
            (element) {
              return element.value.title == x.value["category"];
            },
          );
          _temporaryList.add(
            GroceryItemModel(
                id: x.key,
                name: x.value["name"],
                quantity: x.value["quantity"],
                category: category.value),
          );
        }
        setState(() {
          _groceryItems = _temporaryList;
          _isloading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = "Failed to fetch data. Please try again later.";
        print(e);
        print(_error);
      });
    }
  }

  void _addItem() async {
    final newItem =
        await Navigator.of(context).push<GroceryItemModel>(MaterialPageRoute(
      builder: (context) {
        return NewItem();
      },
    ));

    if (newItem == null) {
      return;
    } else {
      setState(() {
        groceryItemsList.add(newItem);
        _loadItems();
      });
    }
  }

  void _removeFromList(GroceryItemModel m1) {
    final _url = Uri.https("my-database-880f1-default-rtdb.firebaseio.com",
        "shopping_list/${m1.id}.json");
    http.delete(_url);
    setState(() {
      _groceryItems.remove(m1);
    });
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

    if (_isloading) {
      _content = Center(
        child: CircularProgressIndicator(),
      );
    }

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

    if (_error != null) {
      _content = Center(
        child: Text(_error!),
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
