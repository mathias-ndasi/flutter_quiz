import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/results_screen.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  final List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = 'questions-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    debugPrint('Chosen answer: $answer');
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });

      selectedAnswers.clear(); // Clear the list for the next round.
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  Widget getActiveScreen({required String screenName}) {
    switch (screenName) {
      case 'questions-screen':
        return QuestionsScreen(
          onSelectAnswer: chooseAnswer,
        );
      case 'results-screen':
        return ResultsScreen(
          onRestartQuiz: restartQuiz,
        );
      default:
        return StartScreen(switchScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: getActiveScreen(screenName: activeScreen),
        ),
      ),
    );
  }
}
