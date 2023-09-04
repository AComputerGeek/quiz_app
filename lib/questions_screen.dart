// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom widget (StatefulWidget)
class QuestionsScreen extends StatefulWidget {
  // Constructor
  const QuestionsScreen(this.chosenAnswer, {super.key});

  final void Function(String answer) chosenAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// State class for a custom widget (StatefulWidget)
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.chosenAnswer(selectedAnswer);

    if (currentQuestionIndex < (questions.length - 1)) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[currentQuestionIndex].text,
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 222, 198, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              ...questions[currentQuestionIndex].getShuffledAnswers().map(
                (answer) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    child: AnswerButton(answer, () {
                      answerQuestion(answer);
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
