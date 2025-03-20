import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:suat/Widgets/stream_builder.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _mainPage();
  }
}

class _mainPage extends State<Mainpage> {
  final store = FirebaseFirestore.instance;
  TextEditingController modelC = TextEditingController();
  TextEditingController yearC = TextEditingController();
  TextEditingController brandC = TextEditingController();

  @override
  void dispose() {
    modelC.dispose();
    yearC.dispose();
    brandC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colRef = store.collection('Phones');
    // Future<void> printArmut() async {
    //   DocumentSnapshot data = await armut.get(); //DocumentSnapshot içinde map verir
    //   print(data.data()); // bu map'i DocumentSnapshot'den data() diyerek çıkarırız
    // }

    // printArmut();
    void flat() async {
      Map<String, dynamic> PhoneData = {
        'model': '${modelC.text}',
        'year': '${yearC.text}',
        'brand': '${brandC.text}',
      };
      colRef.doc('${brandC.text}').set(PhoneData);
      modelC.clear();
      yearC.clear();
      brandC.clear();
    }

    void upgrade() async {
      colRef.doc('${brandC.text}').update({'crash': 'badly'});
      modelC.clear();
      yearC.clear();
      brandC.clear();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            onPressed: upgrade,
            child: Icon(Icons.upgrade, size: 30),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            onPressed: flat,
            child: Icon(Icons.add, size: 30),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Hi"),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: StreamBuil()),
          Divider(
            thickness: 10,
            color: Theme.of(context).colorScheme.onPrimary,
          ),

          Expanded(
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      showCursor: true,

                      controller: modelC,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(33),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(333),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),
                        labelText: "Model",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: yearC,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(33),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(333),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),
                        labelText: "Year",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: brandC,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(33),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(333),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          ),
                        ),
                        labelText: "Brand",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
