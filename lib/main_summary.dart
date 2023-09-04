// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class MainSummary extends StatelessWidget {
  MainSummary(this.selectedAnswer, {super.key});

  final List<String> selectedAnswer;

// Showing user's answers
  String currentAnswer(List<String> selectedAnswer,
      List<QuizQuestion> questions, QuizQuestion question) {
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].text == question.text) {
        return selectedAnswer[i];
      }
    }

    return '';
  }

  final newList = List.of(questions);

  // Showing correct answers
  String currentCorrectAnswer() {
    var currentElement = '';

    if (newList.isNotEmpty) {
      currentElement = newList.removeAt(0).answers[0];
    }

    return currentElement;
  }

  // All questions
  List<String> allQuestions(List questions) {
    List<String> questionsList = [];

    for (var i = 0; i < questions.length; i++) {
      questionsList.add(questions[i].text);
    }

    return questionsList;
  }

  // Determining correct and wrong answers by colors
  Color currentColor(List<String> selectedAnswer, List<QuizQuestion> questions,
      QuizQuestion question) {
    Color currentColor = Colors.white;

    for (var i = 0; i < questions.length; i++) {
      if (questions[i].text == question.text) {
        if (selectedAnswer[i] == question.answers[0]) {
          currentColor = const Color.fromARGB(255, 135, 255, 183);
        } else {
          currentColor = Color.fromARGB(255, 255, 100, 100);
        }
      }
    }

    return currentColor;
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...questions.map(
              (question) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 15,
                        ),
                        child: CircleAvatar(
                          backgroundColor:
                              currentColor(selectedAnswer, questions, question),
                          radius: 18,
                          child: Text(
                            ((allQuestions(questions).indexOf(question.text)) +
                                    1)
                                .toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question Text
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                question.text,
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            // User Answer
                            Text(
                              currentAnswer(
                                  selectedAnswer, questions, question),
                              style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 255, 106, 205),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            // Correct Answer
                            Text(
                              currentCorrectAnswer(),
                              style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 145, 255, 19),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
