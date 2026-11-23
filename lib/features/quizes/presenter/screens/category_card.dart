import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/quizes/data/models/quiz_category.dart';


import 'category_image.dart';
import 'quiz_info_chip.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.highScore,
    required this.onTap,
  });

  final QuizCategory category;
  final int highScore;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.10)),
          ),
          child: Row(
            children: [
              CategoryImage(categoryId: category.id, image: category.image),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: TextStyle(
                        fontFamily: FontFamily.spaceGrotesk,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamily.spaceGrotesk,
                        fontSize: 13,
                        height: 1.3,
                        color: AppColors.secorndary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        QuizInfoChip(
                          icon: Icons.help_outline,
                          label: '${category.questionCount} Questions',
                        ),
                        QuizInfoChip(
                          icon: Icons.emoji_events_outlined,
                          label: 'Best: $highScore',
                          highlighted: highScore > 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.chevron_right, color: AppColors.secorndary),
            ],
          ),
        ),
      ),
    );
  }
}
