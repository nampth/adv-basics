import 'package:adv_basics/components/questions_summary/question_identifider.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifider(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData['user_answer'] as String,
                  style: TextStyle(
                      color: isCorrectAnswer ? Colors.green : Colors.red),
                ),
                Text(
                  itemData['correct_answer'] as String,
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
