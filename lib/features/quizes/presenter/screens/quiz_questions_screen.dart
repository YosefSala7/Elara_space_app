import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/home/components/custom_arrow_button.dart';
import 'package:space_app/features/quizes/presenter/manager/quiz_cubit.dart';
import 'package:space_app/features/quizes/presenter/manager/quiz_state.dart';
import 'package:space_app/features/quizes/presenter/screens/answers_grid.dart';
import 'package:space_app/features/quizes/presenter/screens/explanation_box.dart';
import 'package:space_app/features/quizes/presenter/screens/next_button.dart';
import 'package:space_app/features/quizes/presenter/screens/question_card.dart';
import 'package:space_app/features/quizes/presenter/screens/quiz_header.dart';
import 'package:space_app/features/quizes/presenter/screens/quiz_progress_bar.dart';
import 'package:space_app/features/quizes/presenter/screens/quiz_results_dialog.dart';
import 'package:space_app/features/quizes/presenter/screens/quiz_scaffold.dart';

class QuizQuestionsScreen extends StatelessWidget {
  const QuizQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listenWhen: (previous, current) =>
          current is QuizCompleted && previous is! QuizCompleted,
      listener: (context, state) {
        if (state is! QuizCompleted) return;
        final cubit = context.read<QuizCubit>();
        QuizResultsDialog.show(
          context,
          result: state.result,
          isNewHighScore: state.isNewHighScore,
          onPlayAgain: cubit.playAgain,
          onBackToCategories: () => Navigator.of(context).pop(),
        );
      },
      // Keep the last question on screen while the results dialog is open.
      buildWhen: (_, current) => current is QuizActive,
      builder: (context, state) {
        if (state is! QuizActive) {
          return const QuizScaffold(child: SizedBox.shrink());
        }
        final cubit = context.read<QuizCubit>();
        final question = state.currentQuestion;

        return QuizScaffold(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomArrowButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      direction: "left",
                    ),
                  ],
                ),
                QuizHeader(score: state.score),
                const SizedBox(height: 22),
                QuizProgressBar(
                  current: state.currentIndex + 1,
                  total: state.totalQuestions,
                  progress: state.progress,
                ),
                const SizedBox(height: 22),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: QuestionCard(
                    key: ValueKey(question.id),
                    categoryLabel: state.category.title,
                    question: question.question,
                    image: question.image,
                  ),
                ),
                const SizedBox(height: 22),
                AnswersGrid(state: state, onAnswerSelected: cubit.selectAnswer),
                if (state.hasAnswered && question.explanation != null) ...[
                  const SizedBox(height: 18),
                  ExplanationBox(text: question.explanation!),
                ],
                const SizedBox(height: 28),
                Center(
                  child: NextButton(
                    enabled: state.hasAnswered,
                    label: state.isLastQuestion ? 'Finish' : 'Next',
                    onPressed: cubit.nextQuestion,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
