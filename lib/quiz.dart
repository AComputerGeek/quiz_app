// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

// Custom widget (StatefulWidget)
class Quiz extends StatefulWidget {
  // Constructor
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// State class for a custom widget (StatefulWidget)
class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  final List<String> selectedAnswer = [];
  var results = false;
  var howManyQuestions = questions.length;
  var howManyCorrectAnswers = 0;

  // Switch screens
  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  // Saving selected answers in a list
  void chosenAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      results = true;

      for (var i = 0; i < questions.length; i++) {
        if (questions[i].answers[0] == selectedAnswer[i]) {
          howManyCorrectAnswers++;
        }
      }

      setState(() {
        ResultsScreen(
            selectedAnswer, howManyQuestions, howManyCorrectAnswers, restart);
        // selectedAnswer.clear();
      });
    }
  }

  // Restart
  void restart() {
    setState(() {
      results = false;
      selectedAnswer.clear();
      howManyCorrectAnswers = 0;
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 187, 127, 255),
                Color.fromARGB(255, 47, 0, 129)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: (activeScreen == 'start_screen')
              ? StartScreen(switchScreen)
              : (!results && (activeScreen == 'questions_screen'))
                  ? QuestionsScreen(chosenAnswer)
                  : ResultsScreen(selectedAnswer, howManyQuestions,
                      howManyCorrectAnswers, restart),
        ),
      ),
    );
  }
}
