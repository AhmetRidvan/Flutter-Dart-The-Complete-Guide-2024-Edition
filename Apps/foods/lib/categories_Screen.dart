import 'package:flutter/material.dart';
import 'package:foods/widgets/app_bar.dart';

class Categoriesscreen extends StatelessWidget {
  Categoriesscreen({super.key});

  @override //3:17
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apb("Pick your category"),
    );
  }

  
}

