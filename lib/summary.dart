import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class questionSummary extends StatelessWidget {
  const questionSummary(this.sumData, {super.key});
  final List<Map<String, Object>> sumData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children:
              sumData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            (data["user_answer"] == data["correct_answer"])
                                ? Colors.green
                                : Colors.red,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 51, 53, 51),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data["question"] as String,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data["user_answer"] as String,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data["correct_answer"] as String,
                            style: const TextStyle(color: Colors.green),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
