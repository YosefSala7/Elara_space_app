import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/quizes/presenter/manager/quiz_state.dart';



class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.text,
    required this.status,
    required this.onTap,
  });

  final String text;
  final AnswerStatus status;
  final VoidCallback? onTap;

  static const _correctGreen = Color(0xFF2ECC71);

  @override
  Widget build(BuildContext context) {
    final Color fill;
    final Color border;
    switch (status) {
      case AnswerStatus.correct:
        fill = _correctGreen.withValues(alpha: 0.30);
        border = _correctGreen;
        break;
      case AnswerStatus.wrong:
        fill = AppColors.primary.withValues(alpha: 0.30);
        border = AppColors.primary;
        break;
      case AnswerStatus.disabled:
        fill = AppColors.white.withValues(alpha: 0.03);
        border = AppColors.white.withValues(alpha: 0.05);
        break;
      case AnswerStatus.idle:
        fill = AppColors.white.withValues(alpha: 0.07);
        border = AppColors.white.withValues(alpha: 0.10);
        break;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: border, width: 1.4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Center(
              child: Text(
                context.tr(text),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 16,
                  color: status == AnswerStatus.disabled
                      ? AppColors.secorndary
                      : AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
