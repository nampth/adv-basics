import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.switchScreen});

  final void Function(String answer) switchScreen;

  @override
  Widget build(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            // Opacity(
            //   opacity: 0.6,
            //   child: Image.asset(
            //     'assets/images/quiz-logo.png',
            //     width: 300,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'),
              onPressed: () {
                switchScreen('questions-screen');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
