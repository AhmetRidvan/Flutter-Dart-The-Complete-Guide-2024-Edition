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
                  child: const Text("Save"))
            ],
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Amount"),
            ),
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
              ElevatedButton(
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
