import 'package:adv_basics/home_screen.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/home_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(switchScreen: switchScreen);
    if (activeScreen == 'questions-screen') {
      setState(() {
        selectedAnswers = [];
      });
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
          choosenAnswer: selectedAnswers, switchScreen: switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
