import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: Color.fromARGB(170, 224, 255, 227),
          ),
          SizedBox(height: 50),
          Text(
            "Ready to start your quiz ?",
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 51, 53, 51),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 194, 255, 188),
            ),
            icon: const Icon(Icons.account_tree),
            label: const Text("Lets Get Started"),
          ),
        ],
      ),
    );
  }
}
