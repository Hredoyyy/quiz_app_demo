import 'package:flutter/material.dart';
import 'package:quiz_app_demo/answer_button.dart';
import 'package:quiz_app_demo/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.addAnswer, {super.key});

  final void Function(String answer) addAnswer;
  @override
  State<Questions> createState() {
    return _Questions();
  }
}

class _Questions extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(selectedAnswer) {
    widget.addAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    if (currentQuestionIndex == questions.length) {
      return const Center(
        child: Text(
          "You did it!",
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      );
    }
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 51, 53, 51),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
