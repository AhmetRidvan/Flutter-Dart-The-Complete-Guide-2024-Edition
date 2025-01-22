import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

void main() {
  runApp(MyApp()); 
}
/*
 4:30
 https://www.youtube.com/watch?v=NznVWf9hFCM&list=LL&index=1&t=4256s
*/


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          
          seedColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: GroceryList(),
    );
  }
}
