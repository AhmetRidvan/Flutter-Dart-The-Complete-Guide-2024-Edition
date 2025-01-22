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
  //GlobalKey Formun durum yönetiminde tam kontrol sağlar bu yüzden Form için tercih edilir.
  //build yeniden çalıştırıldığında durumu yinede korur.
  final _formKey = GlobalKey<FormState>();

  void _save() {
    
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
                        decoration: InputDecoration(label: Text("Quantity")),
                        initialValue: "1",
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
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
                          onChanged: (value) {},
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
                      TextButton(onPressed: () {}, child: Text("Reset")),
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
