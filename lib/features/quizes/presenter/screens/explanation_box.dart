import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class ExplanationBox extends StatelessWidget {
  const ExplanationBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, size: 18, color: AppColors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              context.tr(text),
              style: TextStyle(
                fontFamily: FontFamily.spaceGrotesk,
                fontSize: 13,
                height: 1.4,
                color: AppColors.secorndary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
