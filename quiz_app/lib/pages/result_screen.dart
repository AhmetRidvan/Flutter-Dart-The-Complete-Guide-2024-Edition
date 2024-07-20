import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.gelencevaplar});

  List<String> gelencevaplar;

  List<Map<String, dynamic>> ozetGetir() {
    List<Map<String, dynamic>> ozet = [];

    return ozet;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered X out of Y questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers and questions"),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
