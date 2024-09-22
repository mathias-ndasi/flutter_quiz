import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions_summary/question_identifier.dart';
import 'package:flutter_quiz/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    const incorrectAnswerColor = Color.fromARGB(255, 249, 133, 241);
    const correctAnswerColor = Color.fromARGB(255, 150, 198, 241);

    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var isCorrectAnswer = data['userAnswer'] == data['correctAnswer'];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionIdentifier(
                    isCorrectAnswer: isCorrectAnswer,
                    correctAnswerColor: correctAnswerColor,
                    incorrectAnswerColor: incorrectAnswerColor,
                    questionIndex: data['questionIndex'] as int,
                  ),
                  const SizedBox(width: 10),
                  SummaryItem(
                    summaryData: data,
                    isCorrectAnswer: isCorrectAnswer,
                    correctAnswerColor: correctAnswerColor,
                    incorrectAnswerColor: incorrectAnswerColor,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
