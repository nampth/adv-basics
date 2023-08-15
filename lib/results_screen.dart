import 'package:adv_basics/components/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswer, required this.switchScreen});

  final List<String> choosenAnswer;
  final void Function(String answer) switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((item) {
      return item['correct_answer'] == item['user_answer'];
    }).length;

    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questionts correctly",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {
                switchScreen('questions-screen');
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
