import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.categoryLabel,
    required this.question,
    this.image,
  });

  final String categoryLabel;
  final String question;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final imageSize = (width * 0.32).clamp(90.0, 140.0);
    final hasImage = image != null;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 190),
          padding: EdgeInsets.fromLTRB(
            20,
            hasImage ? imageSize * 0.6 : 24,
            20,
            24,
          ),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryLabel.toUpperCase(),
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 12,
                  letterSpacing: 1,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                question,
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 18,
                  height: 1.35,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        if (hasImage)
          Positioned(
            top: -imageSize * 0.12,
            right: -imageSize * 0.06,
            child: ClipOval(
              child: Image.asset(
                image!,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
      ],
    );
  }
}
