class QuestionModel {
  String question;
  List<String> answers;

  QuestionModel(this.question, this.answers);

  List<String> karistir() {
    final kopya = List.of(answers);
    kopya.shuffle();
    return kopya;
  }
}
