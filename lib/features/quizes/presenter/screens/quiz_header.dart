import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'score_badge.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
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
                context.tr('Cosmic Quiz'),
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        ScoreBadge(score: score),
      ],
    );
  }
}
