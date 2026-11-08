import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';

class LangButton extends StatelessWidget {
  final String text;
  const LangButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontFamily: "SpaceGrotesk",
        ),
      ),
    );
  }
}
