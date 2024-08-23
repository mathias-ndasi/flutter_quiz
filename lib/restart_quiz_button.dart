import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestartQuizButton extends StatelessWidget {
  const RestartQuizButton({super.key, required this.onRestartQuiz});

  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: onRestartQuiz,
      label: Text(
        'Restart Quiz!',
        style: GoogleFonts.lato(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
