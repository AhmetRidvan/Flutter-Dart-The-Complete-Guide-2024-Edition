import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          TextField(
            cursorColor: Colors.red,
            maxLength: 50,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: Text(
                  "Title",
                  style: TextStyle(color: Colors.red),
                )),
          ),
        ],
      ),
    );
  }
}
