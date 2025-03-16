import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/questions_screen.dart';
import 'package:flutter_application_2/result_screen.dart';
import 'package:flutter_application_2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'Start-Screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'Result-Screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Questions-Screen';
    });
  }


  @override
  Widget build(context) {
    Widget selectedScreen = StartScreen(changeScreen);

    if (activeScreen == 'Questions-Screen') {
      selectedScreen = QuestionsScreen(onSelectedAns: addAnswer);
    } else if (activeScreen == 'Result-Screen') {
      selectedScreen = ResultScreen(choosenAnswers: selectedAnswers, restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple, Color.fromARGB(255, 75, 14, 81)],
            ),
          ),
          child: selectedScreen
        ),
      ),
    );
  }
}
