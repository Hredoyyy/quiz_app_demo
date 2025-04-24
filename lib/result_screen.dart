import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quiz_app_demo/data/questions.dart";
import 'package:quiz_app_demo/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.reset, {super.key, required this.selAnswer});
  final void Function() reset;
  final List<String> selAnswer;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < selAnswer.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": selAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final int total = questions.length;
    final int correct =
        summaryData.where((data) {
          return data["user_answer"] == data["correct_answer"];
        }).length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your score is $correct out of $total",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          questionSummary(summaryData),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: reset, child: Text("Restart Quiz")),
        ],
      ),
    );
  }
}
