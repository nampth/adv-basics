import 'package:flutter/material.dart';

class QuestionIdentifider extends StatelessWidget {
  const QuestionIdentifider({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
