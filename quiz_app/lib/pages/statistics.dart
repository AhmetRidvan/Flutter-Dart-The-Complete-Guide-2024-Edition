import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key, required this.StatisticsData});

  List<Map<String, dynamic>> StatisticsData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: StatisticsData.map(
        (data) {
          return  Row(children: [
            Text(data["question_index"] + 1)
          ],);
        },
      ).toList(),
    );
  }
}
