import 'package:space_app/features/quizes/data/models/quiz_category.dart';
import 'package:space_app/features/quizes/data/models/quiz_question.dart';
import 'package:space_app/features/quizes/data/models/quiz_result.dart';


enum AnswerStatus { idle, correct, wrong, disabled }

abstract class QuizState {
  const QuizState();
}

class QuizInitial extends QuizState {
  const QuizInitial();
}

class QuizLoading extends QuizState {
  const QuizLoading();
}

class QuizCategoriesLoaded extends QuizState {
  final List<QuizCategory> categories;
  final Map<String, int> highScores;

  const QuizCategoriesLoaded({
    required this.categories,
    required this.highScores,
  });

  int highScoreOf(String categoryId) => highScores[categoryId] ?? 0;
}

/// Base for every state while a quiz is running.
abstract class QuizActive extends QuizState {
  final QuizCategory category;
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int? selectedAnswerIndex;

  const QuizActive({
    required this.category,
    required this.questions,
    required this.currentIndex,
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    this.selectedAnswerIndex,
  });

  QuizQuestion get currentQuestion => questions[currentIndex];
  int get totalQuestions => questions.length;
  bool get hasAnswered => selectedAnswerIndex != null;
  bool get isLastQuestion => currentIndex == totalQuestions - 1;

  /// Progress bar value (0..1). Counts the current question once answered.
  double get progress => totalQuestions == 0
      ? 0
      : (currentIndex + (hasAnswered ? 1 : 0)) / totalQuestions;

  AnswerStatus statusOf(int answerIndex) {
    if (!hasAnswered) return AnswerStatus.idle;
    if (answerIndex == currentQuestion.correctAnswerIndex) {
      return AnswerStatus.correct;
    }
    if (answerIndex == selectedAnswerIndex) return AnswerStatus.wrong;
    return AnswerStatus.disabled;
  }
}

class QuizStarted extends QuizActive {
  const QuizStarted({
    required super.category,
    required super.questions,
  }) : super(
          currentIndex: 0,
          score: 0,
          correctAnswers: 0,
          wrongAnswers: 0,
        );
}

class QuizAnswerSelected extends QuizActive {
  const QuizAnswerSelected({
    required super.category,
    required super.questions,
    required super.currentIndex,
    required super.score,
    required super.correctAnswers,
    required super.wrongAnswers,
    required int super.selectedAnswerIndex,
  });
}

class QuizNextQuestion extends QuizActive {
  const QuizNextQuestion({
    required super.category,
    required super.questions,
    required super.currentIndex,
    required super.score,
    required super.correctAnswers,
    required super.wrongAnswers,
  });
}

class QuizCompleted extends QuizState {
  final QuizCategory category;
  final QuizResult result;
  final bool isNewHighScore;

  const QuizCompleted({
    required this.category,
    required this.result,
    required this.isNewHighScore,
  });
}

class QuizError extends QuizState {
  final String message;
  const QuizError(this.message);
}
