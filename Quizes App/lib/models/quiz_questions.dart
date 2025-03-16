class QuizQuestions {
  final String text;
  final List<String> ans;

  const QuizQuestions(this.text, this.ans);

  List<String> getShiffeledAnswers() {
    final shuffelesAns = List.of(ans);
    shuffelesAns.shuffle();
    return shuffelesAns;
  }
}
