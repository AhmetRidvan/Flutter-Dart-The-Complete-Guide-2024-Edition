import 'package:flutter/material.dart';
import 'package:quiz_app/page_control.dart';


void main() { 
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build( BuildContext context) {
    return const PageControl();
  }
}
