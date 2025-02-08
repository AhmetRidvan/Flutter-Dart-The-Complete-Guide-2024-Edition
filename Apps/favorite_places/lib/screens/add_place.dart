import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _addPlaceScren();
  }
}

class _addPlaceScren extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  GlobalKey k1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new place",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.surface),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium!.color),
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: "Title",
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("Add place"),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
