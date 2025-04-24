import 'package:flutter/material.dart';
import 'package:quiz_app_demo/data/questions.dart';
import 'package:quiz_app_demo/questions.dart';
import 'package:quiz_app_demo/start_screen.dart';
import 'package:quiz_app_demo/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

List<String> givenAnswers = [];

class _QuizState extends State<Quiz> {
  // Widget? active;

  // @override
  // void initState() {
  //   active = StartScreen(changeScreen);
  //   super.initState();
  // }
  var active = "start";

  void reset() {
    setState(() {
      givenAnswers = [];
      active = "start";
    });
  }

  void changeScreen() {
    setState(() {
      // active = Questions();
      active = "question";
    });
  }

  void selectAnswer(String answer) {
    givenAnswers.add(answer);
    if (givenAnswers.length == questions.length) {
      setState(() {
        active = "result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(changeScreen);
    if (active == "start") {
      screen = StartScreen(changeScreen);
    } else if (active == "question") {
      screen = Questions(selectAnswer);
    } else if (active == "result") {
      screen = ResultScreen(reset, selAnswer: givenAnswers);
    }

    // active == "start"

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
          child: screen,

          // active;
          // active == "start"
          //     ? StartScreen(changeScreen)
          //     : Questions(selectAnswer),
        ),
      ),
    );
  }
}
