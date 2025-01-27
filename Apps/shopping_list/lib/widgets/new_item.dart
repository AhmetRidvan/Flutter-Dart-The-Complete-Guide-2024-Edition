import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories_data.dart';
import 'package:shopping_list/model/category_model.dart';
import 'package:shopping_list/model/grocery_item_model.dart';

import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  //GlobalKey Formun durum yönetiminde tam kontrol sağlar bu yüzden Form için tercih edilir.
  //build yeniden çalıştırıldığında durumu yinede korur.
  final _formKey = GlobalKey<FormState>();
  String _enteredName = "";
  int _enteredQuantity = 1;
  CategoryModel _selectedCategory = categoriesMap[CategoriesEnum.vegetables]!;

  void _save() {
    if (_formKey.currentState!.validate()) {
      //doğrulamadan geçer ise
      //Doğrulamadan geçer ise kaydedicek
      _formKey.currentState!.save();
      final _url = Uri.https('my-database-880f1-default-rtdb.firebaseio.com',
          'shopping_list.json');
      http.post(_url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory.title,
          }));
      Navigator.of(context).pop(GroceryItemModel(
        id: DateTime.now().toString(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Add a new item"),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _enteredName = value;
                      });
                    },
                    maxLength: 50,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length > 50) {
                        return "Must be between 1 and 50 characters";
                      } else {
                        return null; //buradaki null değer geçerli demek
                      }
                    },
                    decoration: InputDecoration(
                      label: Text("Name"),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return "Must be a valid, positive number";
                          } else {
                            return null; //buradaki null değer geçerli demek
                          }
                        },
                        initialValue: _enteredQuantity.toString(),
                        onChanged: (value) {
                          setState(() {
                            int? parseredValue = int.tryParse(value);
                            if (parseredValue != null) {
                              _enteredQuantity = parseredValue;
                            } else {
                              _enteredQuantity = 1;
                            }
                          });
                        },
                        decoration: InputDecoration(label: Text("Quantity")),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectedCategory,
                          dropdownColor:
                              Theme.of(context).colorScheme.onPrimary,
                          // seçili öğeyi göstermek için

                          items: [
                            for (var category in categoriesMap.entries)
                              DropdownMenuItem(
                                  value: category
                                      .value, // hangi değerin seçildiğini anlamak için
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15, //6:48
                                        color: category.value.color,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(category.value.title),
                                    ],
                                  )),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                          },
                          child: Text("Reset")),
                      ElevatedButton(onPressed: _save, child: Text("Add Item"))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
