import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24),
      child: Align(
        alignment: .bottomLeft,
        child: Padding(
          padding: .only(bottom: 130),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                model.label,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  letterSpacing: 1.5,
                  fontFamily: FontFamily.audiowide,
                ),
              ),
              SizedBox(height: 8),
              Text(
                model.title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.spaceGrotesk,
                ),
              ),
              SizedBox(height: 8),
              Text(
                model.description,
                style: TextStyle(
                  color: AppColors.secorndary,
                  fontSize: 11,
                  fontFamily: FontFamily.spaceGrotesk,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
