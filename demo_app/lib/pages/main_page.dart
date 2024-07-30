import 'dart:convert';

import 'package:demo_app/models/urunler_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget { //18:37
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UrunlerModel? m1;

  void _loadData() async {
    final dataString = await rootBundle.loadString("assets/files/data.json");
    var dataJson = jsonDecode(dataString);
    print(dataJson["kategoriler"]);

    setState(() {
      m1 = UrunlerModel.fromJson(dataJson);
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: m1 == null
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...List.generate(
                    m1!.kategoriler1.length,
                    (index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.all(12),
                        padding: EdgeInsets.all(30),
                        child: Text(
                          m1!.kategoriler1[index].isim,
                          style: TextStyle(fontSize: 33),
                        ),
                      );
                    },
                  ),
                ]),
              ),
      ),
    );
  }
}
