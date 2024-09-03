import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  Modal({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Modal();
  }
}

class _Modal extends State<Modal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _datePicker() {
    DateTime dt1 = DateTime.now();
    DateTime first = DateTime(dt1.year - 1, dt1.day, dt1.month); //!!
    DateTime end = DateTime(dt1.year + 1, dt1.month, dt1.day);
    showDatePicker(
        context: context, firstDate: first, lastDate: end, initialDate: dt1);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                  },
                  child: const Text("Save")),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text("\$"),
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("33/22/2023"), //2:34
                  IconButton(
                      onPressed: _datePicker, icon: Icon(Icons.date_range))
                ],
              ))
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_amountController.text);
                  },
                  child: const Text("Save")),
              ElevatedButton(
                  onPressed: () {
                    _amountController.clear();
                    _titleController.clear();
                  },
                  child: const Text("Clear")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
            ],
          )
        ],
      ),
    );
  }
}
