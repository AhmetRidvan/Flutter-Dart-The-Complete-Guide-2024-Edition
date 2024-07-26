import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key, required this.StatisticsData});

  List<Map<String, dynamic>> StatisticsData = [];

  @override
  Widget build(BuildContext context) {
    var list = [Colors.white, Colors.red];
    return SizedBox(
      height: 300,
      width: 350,
      child: SingleChildScrollView(
        child: Column(
          children: StatisticsData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data["user_answer"] == data["correct_answer"]
                            ? list[0]
                            : list[1],
                      ),
                      child: Center(
                          child:
                              Text((data["question_index"] + 1).toString()))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    // altındakinin boyutunu bir üstündeki kadar limitler
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["question"]),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data["user_answer"],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(data["correct_answer"]),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
