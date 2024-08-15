import 'package:expense_tracker_app/models/Expensemodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final formattedDate = DateFormat.yMd();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? secilentarih;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day + 2);

    var pickedDate = await showDatePicker(
        context: context, firstDate: first, lastDate: now, initialDate: now);

    setState(() {
      secilentarih = pickedDate;
    });

    print(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: _titleController,
            cursorColor: Colors.red,
            maxLength: 50,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: Text(
                  "Title",
                  style: TextStyle(color: Colors.red),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                      prefixText: "\$ ",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text(
                        "Amount",
                        style: TextStyle(color: Colors.red),
                      )),
                  controller: _amountController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(secilentarih == null
                        ? "No date selected"
                        : formattedDate.format(secilentarih!)),
                    IconButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                items: CategoryEnum.values
                    .map(
                      (value) => DropdownMenuItem(
                        child: Text(value.name), //3:50
                      ), // eyer name yazmaz isen CategoryEnum.food şeklinde alır ama name ile sadece food yani öğeyi alıyoruz.
                    )
                    .toList(),
                onChanged: (value) {},
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    _titleController.clear();
                    _amountController.clear();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue),
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text(
                    "Save Expense",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
