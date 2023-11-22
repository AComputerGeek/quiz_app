// @author: Amir Armion
// @version: V.01

class QuizQuestion {
  // Constructor
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();

    ////OR
    // return List.of(answers).shuffle();

    return shuffledList;
  }
}
