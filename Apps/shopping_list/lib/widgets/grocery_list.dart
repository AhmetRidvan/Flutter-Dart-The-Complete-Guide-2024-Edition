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
  late Future<List<GroceryItemModel>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItemModel>> _loadItems() async {
    final url = Uri.https(
        'my-database-880f1-default-rtdb.firebaseio.com', 'shopping_list.json');

    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception("Failed to fetch grocery items. Please try again later");
    }

    final List<GroceryItemModel> temporaryList = [];

    if (response.body == "null") {
      return [];
    }

    Map<String, dynamic>? listData = json.decode(response.body);
    if (listData != null) {
      for (final x in listData.entries) {
        final category = categoriesMap.entries.firstWhere(
          (element) {
            return element.value.title == x.value["category"];
          },
        );
        temporaryList.add(
          GroceryItemModel(
              id: x.key,
              name: x.value["name"],
              quantity: x.value["quantity"],
              category: category.value),
        );
      }
    }
    return temporaryList;
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
        _loadedItems = _loadItems();
      });
    }
  }

  void _removeFromList(GroceryItemModel m1) async {
    final items = await _loadedItems;
    final index = items.indexOf(m1);
    setState(() {
      items.remove(m1);
    });

    final url = Uri.https("my-database-880f1-default-rtdb.firebaseio.com",
        "shopping_list/${m1.id}.json");
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error, try again later!")));
        items.insert(index, m1);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Deleted"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ));
    }
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
        body: FutureBuilder(
          future: _loadedItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
              return Center(
                child: Text("Nothing here"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      _removeFromList(snapshot.data![index]);
                    },
                    key: ValueKey(snapshot.data![index].id),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      width: 50,
                      height: 50,
                    ),
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      leading: Container(
                        width: 30,
                        height: 30,
                        color: snapshot.data![index].category.color,
                      ),
                      trailing: Text(snapshot.data![index].quantity.toString()),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
