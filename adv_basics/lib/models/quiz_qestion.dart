class QuizQestion {
  final String text;
  final List<String> answers;

  QuizQestion(this.text, this.answers);

  List<String> getShuffleAnswers() {
    final shuffledList = List.of(answers); // Listenin kopyası
    shuffledList.shuffle(); //shuffle yerinde karıştırır.
    return shuffledList;
  }
}
