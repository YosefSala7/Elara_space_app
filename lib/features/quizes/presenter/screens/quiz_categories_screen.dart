import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/branding.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/quizes/data/models/quiz_category.dart';
import 'package:space_app/features/quizes/presenter/manager/quiz_cubit.dart';
import 'package:space_app/features/quizes/presenter/manager/quiz_state.dart';
import 'package:space_app/features/quizes/presenter/screens/category_card.dart';
import 'package:space_app/features/quizes/presenter/screens/quiz_scaffold.dart';

import 'quiz_questions_screen.dart';

/// Entry point of the quiz feature. Provides the [QuizCubit] to both screens.
class QuizCategoriesScreen extends StatelessWidget {
  const QuizCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit()..loadCategories(),
      child: const _CategoriesView(),
    );
  }
}

class _CategoriesView extends StatelessWidget {
  const _CategoriesView();

  void _openQuiz(BuildContext context, QuizCategory category) {
    final cubit = context.read<QuizCubit>();
    cubit.startQuiz(category);
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (_) => BlocProvider.value(
              value: cubit,
              child: const QuizQuestionsScreen(),
            ),
          ),
        )
        // Refresh high scores whenever we come back (dialog button or back).
        .then((_) => cubit.loadCategories(showLoading: false));
  }

  @override
  Widget build(BuildContext context) {
    return QuizScaffold(
      child: BlocBuilder<QuizCubit, QuizState>(
        // Ignore in-quiz states so the list doesn't flicker underneath.
        buildWhen: (_, current) =>
            current is QuizInitial ||
            current is QuizLoading ||
            current is QuizCategoriesLoaded ||
            current is QuizError,
        builder: (context, state) {
          if (state is QuizCategoriesLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              itemCount: state.categories.length + 1,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, i) {
                if (i == 0) return const _Header();
                final category = state.categories[i - 1];
                return CategoryCard(
                  category: category,
                  highScore: state.highScoreOf(category.id),
                  onTap: () => _openQuiz(context, category),
                );
              },
            );
          }
          if (state is QuizError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.tr(state.message),
                    style: TextStyle(
                      fontFamily: FontFamily.spaceGrotesk,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.read<QuizCubit>().loadCategories(),
                    child: Text(
                      context.tr('Retry'),
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('TEST YOUR KNOWLEDGE'),
          style: TextStyle(
            fontFamily: FontFamily.spaceGrotesk,
            fontSize: 14,
            letterSpacing: context.ls(1.2),
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          context.tr('Choose a Category'),
          style: TextStyle(
            fontFamily: FontFamily.spaceGrotesk,
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          context.tr(
            'Earn +10 for each correct answer, −5 for each wrong one.',
          ),
          style: TextStyle(
            fontFamily: FontFamily.spaceGrotesk,
            fontSize: 13,
            color: AppColors.secorndary,
          ),
        ),
      ],
    );
  }
}
