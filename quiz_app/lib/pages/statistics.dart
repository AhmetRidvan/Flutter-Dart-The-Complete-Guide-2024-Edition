import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key, required this.StatisticsData});

  List<Map<String, dynamic>> StatisticsData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: StatisticsData.map(
        (data) {
          return Row(
            children: [
              Text((data["question_index"] + 1).toString()),
              Expanded( // altındakinin boyutunu bir üstündeki kadar limitler
                child: Column(
                  children: [
                    Text(data["question"]),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data["user_answer"]),
                    Text(data["correct_answer"]),
                  ],
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
