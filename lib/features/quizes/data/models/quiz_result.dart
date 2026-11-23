import 'dart:math';

/// Scoring rules in one place.
class QuizScoring {
  QuizScoring._();

  static const int correctPoints = 10;
  static const int wrongPenalty = 5;

  /// Applies the rules and never lets the score drop below 0.
  static int apply(int currentScore, {required bool isCorrect}) {
    final next = currentScore + (isCorrect ? correctPoints : -wrongPenalty);
    return max(0, next);
  }
}

class QuizResult {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final int finalScore;
  final double percentage;

  const QuizResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.finalScore,
    required this.percentage,
  });

  factory QuizResult.from({
    required int totalQuestions,
    required int correctAnswers,
    required int finalScore,
  }) {
    return QuizResult(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      wrongAnswers: totalQuestions - correctAnswers,
      finalScore: finalScore,
      percentage:
          totalQuestions == 0 ? 0 : correctAnswers / totalQuestions * 100,
    );
  }

  String get message {
    if (percentage >= 90) return "Amazing! You're a true Space Explorer!";
    if (percentage >= 70) return 'Great Job! Keep Exploring!';
    if (percentage >= 50) return "Good Effort! You're Getting Better!";
    return "Don't Give Up! Keep Learning About Space!";
  }
}
