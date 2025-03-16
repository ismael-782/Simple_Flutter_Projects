import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz, {super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummery() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].ans[0],
        'choseen_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummery();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['choseen_answer'] == data['correct_answer'];
    }).length;

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple, Color.fromARGB(255, 75, 14, 81)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You scored $numCorrectQuestions question out of $numTotalQuestions question correctly",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(169, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(
                Icons.replay_circle_filled_sharp,
                color: Colors.white,
              ),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
