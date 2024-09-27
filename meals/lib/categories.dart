import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/Widgets/appbar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Pick your category"),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: const [
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "asd",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
