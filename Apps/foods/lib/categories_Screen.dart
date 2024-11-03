import 'package:flutter/material.dart';
import 'package:foods/widgets/app_bar.dart';

class Categoriesscreen extends StatelessWidget {
  const Categoriesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 3),
        children: [
          
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.amber,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.yellowAccent,
            height: 100,
            width: 100,
          ),
        ],
      ),
      appBar: apb("Pick your category"),
    );
  }
}
