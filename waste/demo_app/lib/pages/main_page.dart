import 'dart:convert';

import 'package:demo_app/models/urunler_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  //18:37
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UrunlerModel? veriler;
  List<Urun> _urunler = [];

  void _loadData() async {
    final dataString = await rootBundle.loadString("assets/files/data.json");
    var dataJson = jsonDecode(dataString);
    print(dataJson["kategoriler"]);

    setState(() {
      veriler = UrunlerModel.fromJson(dataJson);
      _urunler = veriler!.urunler;
    });
  }

  void filterData(int id) {
    _urunler = veriler!.urunler.where(
      (gelenElemanlar) {
        return gelenElemanlar.kategory == id;
      },
    ).toList();
    setState(() {});
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
        child: veriler == null
            ? const CircularProgressIndicator()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(),
                    SizedBox(
                      height: 33,
                    ),
                    list()
                  ],
                ),
              ),
      ),
    );
  }

  Expanded list() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        shrinkWrap: true, // kendini kısıtla
        itemCount: _urunler.length,
        itemBuilder: (context, index) {
          final urunSayaci = _urunler![index];
          return ListTile(
            leading: Image.network(
              urunSayaci.resim,
              width: 100,
              fit: BoxFit.cover,
              height: 100,
            ),
            title: Text(urunSayaci.isim),
          );
        },
      ),
    );
  }

  Row Category() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...List.generate(
        veriler!.kategoriler1.length,
        (index) {
          return GestureDetector(
            onTap: () {
              filterData(veriler!.kategoriler1[index].id);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(2),
              padding: EdgeInsets.all(5),
              child: Text(
                veriler!.kategoriler1[index].isim,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    ]);
  }
}
