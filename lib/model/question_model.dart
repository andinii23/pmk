class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(Question(
      "Apakah sapi mengalami demam tinggi hingga 39 – 41 derajat celcius?", [
    Answer("Ya", true),
    Answer("Tidak", false),
  ]));
  list.add(Question("Apakah sapi mengalami penurunan nafsu makan?", [
    Answer("Ya", true),
    Answer("Tidak", false),
  ]));
  list.add(Question("Apakah sapi mengalami penurunan berat badan?", [
    Answer("Ya", true),
    Answer("Tidak", false),
  ]));
  list.add(Question(
      "Apakah sapi sering menggeretakkan gigi dan menggosokkan mulut?", [
    Answer("Ya", true),
    Answer("Tidak", false),
  ]));
  list.add(Question("Apakah sapi sering menendangkan kaki?", [
    Answer("Ya", true),
    Answer("Tidak", false),
  ]));
  list.add(Question("Apakah belah pada kuku sapi terluka?", [
    Answer("Ya", true),
    Answer("Tidak", false),
  ]));

  return list;
}
