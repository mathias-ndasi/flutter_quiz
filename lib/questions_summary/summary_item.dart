import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quiz/questions_summary/answer_item.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.summaryData,
    required this.isCorrectAnswer,
    required this.correctAnswerColor,
    required this.incorrectAnswerColor,
  });

  final bool isCorrectAnswer;
  final Color correctAnswerColor;
  final Color incorrectAnswerColor;
  final Map<String, Object> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            summaryData['question'] as String,
            style: GoogleFonts.lato(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
          const SizedBox(height: 5),
          AnswerItem(
            label: 'Your answer',
            text: summaryData['userAnswer'] as String,
            color: isCorrectAnswer ? correctAnswerColor : incorrectAnswerColor,
          ),
          AnswerItem(
            label: 'Correct answer',
            color: correctAnswerColor,
            text: summaryData['correctAnswer'] as String,
          ),
        ],
      ),
    );
  }
}
