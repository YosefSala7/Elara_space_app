import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/quizes/data/models/quiz_category.dart';
import 'package:space_app/features/quizes/data/models/quiz_result.dart';
import 'package:space_app/features/quizes/data/repos/quiz_repository.dart';

import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({QuizRepository? repository})
      : _repository = repository ?? QuizRepository(),
        super(const QuizInitial());

  final QuizRepository _repository;
  bool _isCompleting = false;

  Future<void> loadCategories({bool showLoading = true}) async {
    if (showLoading) emit(const QuizLoading());
    try {
      final categories = _repository.getCategories();
      final highScores = await _repository.loadHighScores();
      emit(QuizCategoriesLoaded(categories: categories, highScores: highScores));
    } catch (_) {
      emit(const QuizError('Could not load quiz categories.'));
    }
  }

  /// Starts (or restarts) a quiz with a brand-new random question set.
  void startQuiz(QuizCategory category) {
    _isCompleting = false;
    try {
      final questions = _repository.buildQuiz(category.id);
      if (questions.isEmpty) {
        emit(const QuizError('No questions available for this category.'));
        return;
      }
      emit(QuizStarted(category: category, questions: questions));
    } catch (_) {
      emit(const QuizError('Could not start the quiz.'));
    }
  }

  void playAgain() {
    final current = state;
    if (current is QuizCompleted) startQuiz(current.category);
  }

  void selectAnswer(int answerIndex) {
    final current = state;
    if (current is! QuizActive) return;
    if (current.hasAnswered) return; // one answer per question, no changes
    if (answerIndex < 0 ||
        answerIndex >= current.currentQuestion.answers.length) {
      return;
    }

    final isCorrect = answerIndex == current.currentQuestion.correctAnswerIndex;
    emit(QuizAnswerSelected(
      category: current.category,
      questions: current.questions,
      currentIndex: current.currentIndex,
      score: QuizScoring.apply(current.score, isCorrect: isCorrect),
      correctAnswers: current.correctAnswers + (isCorrect ? 1 : 0),
      wrongAnswers: current.wrongAnswers + (isCorrect ? 0 : 1),
      selectedAnswerIndex: answerIndex,
    ));
  }

  Future<void> nextQuestion() async {
    final current = state;
    if (current is! QuizActive || !current.hasAnswered) return;

    if (current.isLastQuestion) {
      await _complete(current);
      return;
    }

    emit(QuizNextQuestion(
      category: current.category,
      questions: current.questions,
      currentIndex: current.currentIndex + 1,
      score: current.score,
      correctAnswers: current.correctAnswers,
      wrongAnswers: current.wrongAnswers,
    ));
  }

  Future<void> _complete(QuizActive current) async {
    if (_isCompleting) return;
    _isCompleting = true;

    final result = QuizResult.from(
      totalQuestions: current.totalQuestions,
      correctAnswers: current.correctAnswers,
      finalScore: current.score,
    );

    var isNewHighScore = false;
    try {
      isNewHighScore = await _repository.saveHighScoreIfBetter(
        current.category.id,
        result.finalScore,
      );
    } catch (_) {
      // Saving the high score must never block showing the results.
    }

    emit(QuizCompleted(
      category: current.category,
      result: result,
      isNewHighScore: isNewHighScore,
    ));
  }
}
