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
                children: [
                  const Text("33/22/2023"), //2:34
                  IconButton(onPressed: () {}, icon: const Icon(Icons.date_range))
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
