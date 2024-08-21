import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.onRestartQuiz});

  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You answered X out of Y questions correctly!',
            ),
            const SizedBox(height: 30),
            const Text('List of answers and questions...'),
            const SizedBox(height: 30),
            TextButton(
              onPressed: onRestartQuiz,
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
