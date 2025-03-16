import 'package:flutter/material.dart';
import 'package:flutter_application_2/answer_buttons.dart';
import 'package:flutter_application_2/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAns});

  final void Function(String answer) onSelectedAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var questionIndex = 0;

  void changeQuestion(String ans) {
    widget.onSelectedAns(ans);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShiffeledAnswers().map((choiceName) {
              return AnswerButton(
                onTap: () {
                  changeQuestion(choiceName);
                },
                Answer: choiceName,
              );
            }),
          ],
        ),
      ),
    );
  }
}
