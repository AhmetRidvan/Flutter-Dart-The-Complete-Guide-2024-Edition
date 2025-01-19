import 'package:flutter/material.dart';

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
            )
          ],
        )),
      ),
    );
  }
}
