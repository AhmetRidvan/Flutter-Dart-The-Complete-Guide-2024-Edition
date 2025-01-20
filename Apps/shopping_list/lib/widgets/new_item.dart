import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories_data.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new item"),
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              validator: (value) {
                return "Demo...";
              },
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(label: Text("Quantity")),
                  initialValue: "1",
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    // seçili öğeyi göstermek için
                    value: categoriesMap[CategoriesEnum.vegetables],
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
                       
                    },
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
