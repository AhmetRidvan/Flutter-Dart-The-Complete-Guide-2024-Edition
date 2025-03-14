import 'package:expense_tracker_app/models/Expensemodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.incomingFunction});

  void Function(Expensemodel Expensemodel1) incomingFunction;

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
  CategoryEnum _selectedCategory = CategoryEnum.leisure;

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
//trim() sağdaki ve soldaki boşlukları iptal eder.
// and && or ||

  void _saveExpense() {
    var enteredAmount = double.tryParse(_amountController.text);
    bool CheckEnteredAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        CheckEnteredAmount ||
        secilentarih == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Invalid input"),
            content: const Text(
              "Please make sure a valid title, amount, date and category was entered",
              style: TextStyle(fontSize: 30),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
    } else {
      widget.incomingFunction(Expensemodel(
          title: _titleController.text,
          amount: enteredAmount,
          date: secilentarih!,
          category: _selectedCategory));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        15,
        60,
        15,
        15,
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
                        : formattedDate.format(secilentarih!)
                        ,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 13),),
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
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DropdownButton(
                  dropdownColor: Colors.green,
                  value: _selectedCategory,
                  items: CategoryEnum.values
                      .map(
                        (value) => DropdownMenuItem(
                          value: value, //Hangisi seçildiyseyi aşağı gönderiyor
                          child: Text(value.name.toUpperCase(),style: Theme.of(context).textTheme.titleLarge,), //3:50
                        ), // Eyer name yazmaz isen CategoryEnum.food şeklinde alır ama name ile sadece food yani öğeyi alıyoruz.
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return; //return son k oddur devamı çalışmaz
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ElevatedButtonTheme.of(context).style,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                    )),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ElevatedButtonTheme.of(context).style,
                    onPressed: () {
                      setState(() {
                        _titleController.clear();
                        _amountController.clear();
                        _selectedCategory = CategoryEnum.leisure;
                        secilentarih = null;
                      });
                    },
                    child: const Text(
                      "Clear",
                    )),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ElevatedButtonTheme.of(context).style,
                    onPressed: _saveExpense,
                    child: Text(
                      "Save Expense",
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
