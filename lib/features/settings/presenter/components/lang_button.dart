import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:space_app/core/app_colors.dart';

class LangButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  const LangButton({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLayer(
      settings: LiquidGlassSettings.ios27RegularDark(),
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 20),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: .all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.black.withValues(alpha: 0.35)
                  : AppColors.whiteColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: "SpaceGrotesk",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
