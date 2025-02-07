import 'dart:math';

import 'package:favorite_places/data/List_data.dart';
import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewItem extends ConsumerStatefulWidget {
  const NewItem({super.key});
  @override
  ConsumerState<NewItem> createState() {
    return _newItem();
  }
}

class _newItem extends ConsumerState<NewItem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   
    Random r1 = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add new place"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 300, 
                child: TextFormField(
                  onSaved: (newValue) {
                    ref.read(ListProvider.notifier).addItem(
                          Place(
                            title: newValue!,
                            id: r1.nextInt(999).toString(),
                          ),
                        );
                  },
                  decoration: InputDecoration(hintText: "Title"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  _formKey.currentState!.reset();

                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
