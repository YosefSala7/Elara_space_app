import 'dart:math';

class QuizQuestion {
  final String id;
  final String categoryId;
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;
  final String? image;
  final String? explanation;

  const QuizQuestion({
    required this.id,
    required this.categoryId,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    this.image,
    this.explanation,
  });

  String get correctAnswer => answers[correctAnswerIndex];

  /// Returns a copy with shuffled answers; the correct index is recalculated.
  QuizQuestion shuffled(Random random) {
    final correct = answers[correctAnswerIndex];
    final newAnswers = List<String>.from(answers)..shuffle(random);
    return QuizQuestion(
      id: id,
      categoryId: categoryId,
      question: question,
      answers: newAnswers,
      correctAnswerIndex: newAnswers.indexOf(correct),
      image: image,
      explanation: explanation,
    );
  }
}
