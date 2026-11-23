import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/quizes/data/models/quiz_result.dart';

class QuizResultsDialog extends StatelessWidget {
  const QuizResultsDialog({
    super.key,
    required this.result,
    required this.isNewHighScore,
    required this.onPlayAgain,
    required this.onBackToCategories,
  });

  final QuizResult result;
  final bool isNewHighScore;
  final VoidCallback onPlayAgain;
  final VoidCallback onBackToCategories;

  /// Shows the dialog. Both buttons close the dialog first, then run the callback.
  static Future<void> show(
    BuildContext context, {
    required QuizResult result,
    required bool isNewHighScore,
    required VoidCallback onPlayAgain,
    required VoidCallback onBackToCategories,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (dialogContext) => PopScope(
        canPop: false,
        child: QuizResultsDialog(
          result: result,
          isNewHighScore: isNewHighScore,
          onPlayAgain: () {
            Navigator.of(dialogContext).pop();
            onPlayAgain();
          },
          onBackToCategories: () {
            Navigator.of(dialogContext).pop();
            onBackToCategories();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF0D0D0D),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.5)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 28, 22, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.emoji_events, size: 48, color: AppColors.primary),
              const SizedBox(height: 12),
              Text(
                'QUIZ COMPLETE',
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 13,
                  letterSpacing: 1.4,
                  color: AppColors.secorndary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${result.finalScore}',
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              Text(
                'FINAL SCORE',
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 12,
                  letterSpacing: 1,
                  color: AppColors.primary,
                ),
              ),
              if (isNewHighScore) ...[
                const SizedBox(height: 10),
                Text(
                  '★ New High Score!',
                  style: TextStyle(
                    fontFamily: FontFamily.spaceGrotesk,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  _Stat(label: 'Correct', value: '${result.correctAnswers}'),
                  const SizedBox(width: 10),
                  _Stat(label: 'Wrong', value: '${result.wrongAnswers}'),
                  const SizedBox(width: 10),
                  _Stat(
                    label: 'Accuracy',
                    value: '${result.percentage.round()}%',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                result.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.spaceGrotesk,
                  fontSize: 16,
                  height: 1.4,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onPlayAgain,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Play Again',
                    style: TextStyle(
                      fontFamily: FontFamily.spaceGrotesk,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onBackToCategories,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    side: BorderSide(color: AppColors.secorndary),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Back to Categories',
                    style: TextStyle(
                      fontFamily: FontFamily.spaceGrotesk,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: FontFamily.spaceGrotesk,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontFamily: FontFamily.spaceGrotesk,
                fontSize: 12,
                color: AppColors.secorndary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
