import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrectAnswer,
    required this.correctAnswerColor,
    required this.incorrectAnswerColor,
  });

  final int questionIndex;
  final bool isCorrectAnswer;
  final Color correctAnswerColor;
  final Color incorrectAnswerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? correctAnswerColor : incorrectAnswerColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '${(questionIndex) + 1}',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
