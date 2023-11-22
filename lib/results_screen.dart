// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/main_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswer, this.howManyQuestions,
      this.howManyCorrectAnswers, this.restart,
      {super.key});

  final List<String> selectedAnswer;
  final int howManyQuestions;
  final int howManyCorrectAnswers;
  final void Function() restart;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '"You answered $howManyCorrectAnswers out of $howManyQuestions questions correctly!"',
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 222, 198, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              MainSummary(selectedAnswer),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: OutlinedButton.icon(
                  onPressed: restart,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.restart_alt_rounded),
                  label: Text(
                    "Restart Quiz",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
