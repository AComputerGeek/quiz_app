// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.answerQuestion, {super.key});

  final String answer;
  final void Function() answerQuestion;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: answerQuestion,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 34, 0, 89),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        answer,
        style: const TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
