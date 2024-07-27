import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statistics extends StatelessWidget {
  Statistics(
      {super.key,
      required this.StatisticsData,
      required this.dogru,
      required this.toplam});

  List<Map<String, dynamic>> StatisticsData = [];
  int dogru, toplam;

  @override
  Widget build(BuildContext context) {
    var list = [Colors.white, Colors.red];
    return SizedBox(
      height: 300,
      width: 350,
      child: SingleChildScrollView(
        child: Column(children: [
          Text(
            textAlign: TextAlign.center,
            "You answered $dogru out of $toplam questions correctly!",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...StatisticsData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
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
                    const SizedBox(
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
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(data["correct_answer"]),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ]),
      ),
    );
  }
}
