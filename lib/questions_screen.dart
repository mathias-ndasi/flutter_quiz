import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  _QuestionsScreenState();

  var currentQuestionIndex = 0;
  Map<int, bool> quizResults = <int, bool>{};

  @override
  void initState() {
    super.initState();
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      final isAnswerCorrect =
          selectedAnswer == questions[currentQuestionIndex].answers[0];
      quizResults[currentQuestionIndex] = isAnswerCorrect;

      // Switch to the next question
      currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
      if (currentQuestionIndex == 0) {
        debugPrint('End of quiz: $quizResults');
      }
    });
  }

  @override
  Widget build(Object context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ...currentQuestion.shuffledAnswers.map((selectedAnswer) {
                return AnswerButton(
                    answerText: selectedAnswer,
                    onClick: () => answerQuestion(selectedAnswer));
              }),
            ]),
      ),
    );
  }
}
