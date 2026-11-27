import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/features/quizes/data/models/quiz_category.dart';
import 'package:space_app/features/quizes/data/models/quiz_question.dart';

import 'quiz_local_data_source.dart';

class QuizRepository {
  QuizRepository({QuizLocalDataSource? dataSource, Random? random})
      : _dataSource = dataSource ?? QuizLocalDataSource(),
        _random = random ?? Random();

  final QuizLocalDataSource _dataSource;
  final Random _random;

  static const _highScorePrefix = 'quiz_high_score_';

  List<QuizCategory> getCategories() => _dataSource.getCategories();

  /// Random subset of questions, each with randomized answer order.
  List<QuizQuestion> buildQuiz(String categoryId) {
    final all = _dataSource.getQuestions(categoryId)..shuffle(_random);
    return all
        .take(QuizLocalDataSource.questionsPerQuiz)
        .map((q) => q.shuffled(_random))
        .toList();
  }

  Future<Map<String, int>> loadHighScores() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      for (final c in getCategories())
        c.id: prefs.getInt('$_highScorePrefix${c.id}') ?? 0,
    };
  }

  /// Saves [score] if it beats the stored one. Returns true if it did.
  Future<bool> saveHighScoreIfBetter(String categoryId, int score) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_highScorePrefix$categoryId';
    final previous = prefs.getInt(key) ?? 0;
    if (score > previous) {
      await prefs.setInt(key, score);
      return true;
    }
    return false;
  }
}
