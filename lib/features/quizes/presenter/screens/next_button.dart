import 'package:flutter/material.dart';

import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.enabled,
    required this.onPressed,
    this.label = 'Next',
  });

  final bool enabled;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: enabled ? 1 : 0.4,
      child: Material(
        color: AppColors.primary,
        shape: const StadiumBorder(),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: enabled ? onPressed : null,
          child: Container(
            width: 190,
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: FontFamily.spaceGrotesk,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Icon(Icons.arrow_forward, size: 18, color: AppColors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
