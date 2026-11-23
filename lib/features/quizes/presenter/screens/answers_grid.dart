import 'package:flutter/material.dart';
import 'package:space_app/features/quizes/presenter/manager/quiz_state.dart';

import 'answer_option.dart';

/// 2x2 grid of answers. Only presentation: all rules live in the cubit.
class AnswersGrid extends StatelessWidget {
  const AnswersGrid({
    super.key,
    required this.state,
    required this.onAnswerSelected,
  });

  final QuizActive state;
  final ValueChanged<int> onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    final answers = state.currentQuestion.answers;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        mainAxisExtent: 64,
      ),
      itemBuilder: (context, i) => AnswerOption(
        text: answers[i],
        status: state.statusOf(i),
        onTap: state.hasAnswered ? null : () => onAnswerSelected(i),
      ),
    );
  }
}
