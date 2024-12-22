import 'package:flutter/material.dart';

class Nothing extends StatefulWidget {
  Nothing({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Nothing();
  }
}

class _Nothing extends State<Nothing> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hi"),
          ],
        ),
      ),
    );
  }
}
