import 'package:flutter/material.dart';
import 'package:quiz_app_demo/questions.dart';
import 'package:quiz_app_demo/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget active = StartScreen();

  void ChangeScreen() {
    setState(() {
      active = Questions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightGreen, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: active,
        ),
      ),
    );
  }
}
