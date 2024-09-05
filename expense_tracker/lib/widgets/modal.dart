import 'package:expense_tracker/models/expense_model.dart';
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
  Category g1 = Category.food;
  DateTime? selectedDate;

  void _datePicker() {
    DateTime dt1 = DateTime.now();
    DateTime first = DateTime(dt1.year - 1, dt1.day, dt1.month); //!!
    DateTime end = DateTime(dt1.year + 1, dt1.month, dt1.day);
    showDatePicker(
            context: context, firstDate: first, lastDate: end, initialDate: dt1)
        .then(
      (value) {
        setState(() {
          selectedDate = value;
        });
      },
    );
  }

  submitData() {
    double? sayi = double.tryParse(_amountController.text);
    bool evetHayir = sayi == null || sayi <= 0;

    if (_titleController.text.trim().isEmpty ||
        evetHayir ||
        selectedDate == null) {
      print("Hatalı giriş");
    }
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
                  Text(selectedDate == null
                      ? "No date"
                      : formattedDatetime.format(selectedDate!)), //2:34
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                icon: Icon(Icons.emoji_objects),
                value: g1,
                items: Category.values.map(
                  (e) {
                    return DropdownMenuItem(
                        value: e, child: Text(e.name.toUpperCase()));
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    g1 = value!;
                    print(g1);
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(onPressed: submitData, child: const Text("Save")),
              ElevatedButton(
                  onPressed: () {
                    _amountController.clear();
                    _titleController.clear();
                    selectedDate = null;
                    setState(() {});
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
