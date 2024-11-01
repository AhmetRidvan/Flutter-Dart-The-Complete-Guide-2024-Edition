import 'package:flutter/material.dart';
import 'package:foods/widgets/app_bar.dart';

class Categoriesscreen extends StatelessWidget {
  const Categoriesscreen({super.key});

  @override //3:17
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.purple,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.black,
            height: 100,
            width: 100,
          ),
        ],
      ),
      appBar: apb("Pick your category"),
    );
  }
}
