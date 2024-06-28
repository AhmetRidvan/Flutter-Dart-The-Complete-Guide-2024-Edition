import 'package:flutter/material.dart';

class QuiestionsScreen extends StatefulWidget {
  const QuiestionsScreen({super.key});

  @override
  State<QuiestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuiestionsScreen> {
  @override
  Widget build(context) {
    return Column(
      children: [
        const Text("Question..."),
        ElevatedButton(onPressed: () {}, child: const Text("Answer 1")),
        ElevatedButton(onPressed: () {}, child: const Text("Answer 2")),
        ElevatedButton(onPressed: () {}, child: const Text("Answer 3")),
        ElevatedButton(onPressed: () {}, child: const Text("Answer 4")),
        ElevatedButton(onPressed: () {}, child: const Text("Answer 5")),
      ],
    );
  }
}
